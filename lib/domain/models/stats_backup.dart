class StatsBackup {
  final int version;
  final String exportedAt;
  final List<StatsBackupResponse> responses;

  const StatsBackup({
    required this.version,
    required this.exportedAt,
    required this.responses,
  });

  factory StatsBackup.fromJson(Map<String, dynamic> json) {
    final rawResponses = (json['responses'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .toList();
    return StatsBackup(
      version: (json['version'] as num?)?.toInt() ?? 1,
      exportedAt: json['exportedAt']?.toString() ?? '',
      responses: rawResponses.map(StatsBackupResponse.fromJson).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'exportedAt': exportedAt,
      'responses': responses.map((response) => response.toJson()).toList(),
    };
  }
}

class StatsBackupResponse {
  final String timestamp;
  final bool isCorrect;
  final String kanaType;

  const StatsBackupResponse({
    required this.timestamp,
    required this.isCorrect,
    required this.kanaType,
  });

  factory StatsBackupResponse.fromJson(Map<String, dynamic> json) {
    final isCorrectRaw = json['is_correct'];
    return StatsBackupResponse(
      timestamp: json['timestamp']?.toString() ?? '',
      isCorrect: isCorrectRaw == true || isCorrectRaw == 1,
      kanaType: json['kana_type']?.toString() ?? 'hiragana',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'is_correct': isCorrect ? 1 : 0,
      'kana_type': kanaType,
    };
  }
}
