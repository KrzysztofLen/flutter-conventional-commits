// ignore_for_file: avoid_print
import 'dart:io';

// dynamic main() {
//   final rootDir = Directory.current;
//   final commitFile = File("${rootDir.path}/.git/COMMIT_EDITMSG");
//   final commitMessage = commitFile.readAsStringSync();

//   final regExp = RegExp(
//     r'(fix|feat|chore|docs)\:.+',
//   );

//   final valid = regExp.hasMatch(commitMessage);
//   if (!valid) {
//     print('''👎 Bad commit message!''');
//     exitCode = 1;
//   } else {
//     print('''👍 Nice commit message dude!''');
//   }
// }

void main() {
  final commitMessageFile = File('.git/COMMIT_EDITMSG');

  if (!commitMessageFile.existsSync()) {
    print('Commit message file does not exist.');
    exit(1);
  }

  final commitMessage = commitMessageFile.readAsStringSync();

  if (!isValidCommitMessage(commitMessage)) {
    print('👎 Invalid commit message format.');
    print('Commit message should follow the Conventional Commits format.');
    exit(1);
  }

  print('''👍 Valid commit message!''');
  exit(0);
}

bool isValidCommitMessage(String commitMessage) {
  final RegExp pattern = RegExp(r'^(feat|fix|docs|chore)(\(.+\))?: .+');
  return pattern.hasMatch(commitMessage);
}
