// Receives drawing reports from KanaGo ("my drawing was right but the model
// said no"), emails each one with the drawing attached and keeps a copy in
// Google Drive. Free: runs on Google Apps Script with your Google account.
//
// Setup (once):
// 1. Go to https://script.google.com, create a new project and paste this file.
// 2. Deploy > New deployment > type "Web app".
//    Execute as: Me. Who has access: Anyone.
// 3. Authorize it, copy the web app URL (ends in /exec) and put it in
//    lib/config/report_config.dart (see report_config.example.dart).
//
// If you change this code, use Deploy > Manage deployments > Edit > New
// version so the URL stays the same.

// Must match reportToken in lib/config/report_config.dart.
const TOKEN = 'PASTE_THE_TOKEN_FROM_report_config.dart';
const FOLDER_NAME = 'KanaGo drawing reports';

function doPost(e) {
  if (!e || !e.parameter || e.parameter.token !== TOKEN) {
    return reply({ ok: false, error: 'unauthorized' });
  }
  const report = JSON.parse(e.postData.contents);
  const stamp = String(report.created_at_utc || new Date().toISOString())
    .replace(/[:.]/g, '-');
  const name = [stamp, report.script, report.expected_label].join('_');

  const png = Utilities.newBlob(
    Utilities.base64Decode(report.drawing_png_base64 || ''),
    'image/png',
    name + '.png'
  );
  const details = Object.assign({}, report);
  delete details.drawing_png_base64;
  const json = Utilities.newBlob(
    JSON.stringify(details, null, 2),
    'application/json',
    name + '.json'
  );

  const folder = getFolder();
  folder.createFile(png);
  folder.createFile(json);

  MailApp.sendEmail({
    to: Session.getEffectiveUser().getEmail(),
    subject: 'KanaGo report: ' + report.expected_label +
      ' drawn, model said ' + report.predicted_label,
    htmlBody:
      '<p>Script: ' + report.script + '<br>' +
      'Expected: <b>' + report.expected_label + '</b><br>' +
      'Predicted: <b>' + report.predicted_label + '</b> (' +
      Math.round((report.confidence || 0) * 100) + '%)<br>' +
      'Strokes: ' + report.stroke_count + '</p>' +
      '<p><img src="cid:drawing" width="280"></p>' +
      '<p>Saved in Google Drive, folder "' + FOLDER_NAME + '".</p>',
    inlineImages: { drawing: png },
    attachments: [json],
  });

  return reply({ ok: true });
}

function getFolder() {
  const folders = DriveApp.getFoldersByName(FOLDER_NAME);
  return folders.hasNext() ? folders.next() : DriveApp.createFolder(FOLDER_NAME);
}

function reply(body) {
  return ContentService.createTextOutput(JSON.stringify(body))
    .setMimeType(ContentService.MimeType.JSON);
}
