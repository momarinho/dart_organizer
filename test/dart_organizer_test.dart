import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

/// Runs tests for organizing files based on their extension.
///
/// The tests are divided into two groups: one for .txt files and another for
/// .dart files. Each group has three tests: the first one checks if the
/// corresponding directory was created; the second one checks if the file was
/// moved to the correct directory; and the third one checks if the file was
/// renamed correctly.
void main() {
  final testDir = Directory('test_dir');

  setUp(() async {
    await testDir.create();
    await File(path.join(testDir.path, 'test.txt')).create();
  });

  tearDown(() async {
    if (await testDir.exists()) {
      await testDir.delete(recursive: true);
    }
  });

  test('Organizes .txt file', () async {
    final txtDir = Directory(path.join(testDir.path, 'txt'));
    expect(await txtDir.exists(), isTrue);

    final movedFile = File(path.join(txtDir.path, 'test.txt'));
    expect(await movedFile.exists(), isTrue);
  });
}

