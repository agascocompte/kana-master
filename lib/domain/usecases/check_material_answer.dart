import 'package:injectable/injectable.dart';

@injectable
class CheckMaterialAnswer {
  bool call(String userInput, String correct) {
    String normalize(String input) => input
        .toLowerCase()
        .replaceAll(RegExp(r'[\[\]\(\)\{\}\.,;:!?¿¡\-_/]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    final user = normalize(userInput);
    final correctNorm = normalize(correct);

    if (user.isEmpty || correctNorm.isEmpty) return false;

    final correctParts = correctNorm
        .split(RegExp(r'[/|]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty);

    for (final part in correctParts) {
      if (user.contains(part) || part.contains(user)) {
        return true;
      }
    }
    return correctNorm.contains(user) || user.contains(correctNorm);
  }
}
