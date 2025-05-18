import 'dart:io';
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  // Get target directory from arguments or use current directory
  final targetDir = await getTargetDirectory(arguments);
  
  // List all files in the target directory
  final files = await listFiles(targetDir);

  // Organize each file by its extension
  for (final file in files) {
    await organizeFile(file, targetDir.path);
  }
}

// Returns the target directory based on arguments or current directory
Future<Directory> getTargetDirectory(List<String> arguments) async {
  final directoryPath = arguments.isNotEmpty ? arguments.first : Directory.current.path;
  final directory = Directory(directoryPath);

  if (!await directory.exists()) {
    throw ArgumentError('Directory "$directoryPath" does not exist.');
  }

  return directory;
}

// Lists all files in the given directory
Future<List<File>> listFiles(Directory directory) async {
  return await directory
      .list()
      .where((entity) => entity is File)
      .cast<File>()
      .toList();
}

// Organizes the file into a folder based on its extension
Future<void> organizeFile(File file, String basePath) async {
  try {
    // Extract file extension and determine folder name
    final extension = path.extension(file.path).replaceAll('.', '');
    final folderName = extension.isEmpty ? 'others' : extension;

    // Create folder if it does not exist
    final newDirectory = Directory(path.join(basePath, folderName));
    await newDirectory.create(recursive: true);

    // Move file to the newly created folder
    final newPath = path.join(newDirectory.path, path.basename(file.path));
    await file.rename(newPath);

    print('File "${file.path}" moved to "$newPath".');
  } catch (e) {
    print('Error moving file "${file.path}": $e');
  }
}

