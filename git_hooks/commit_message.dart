// ignore_for_file: avoid_print
import 'dart:io';

dynamic main() {
  final rootDir = Directory.current;
  final commitFile = File("${rootDir.path}/.git/COMMIT_EDITMSG");
  final commitMessage = commitFile.readAsStringSync();

  final regExp = RegExp(
    r'(fix|feat|chore|docs)\:.+',
  );

  final valid = regExp.hasMatch(commitMessage);
  if (!valid) {
    print('''👎 Bad commit message!''');
    exitCode = 1;
  } else {
    print('''👍 Nice commit message dude!''');
  }
}
