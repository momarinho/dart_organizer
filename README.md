# File Organizer

A simple Dart command-line application to organize files in a specified directory into subdirectories based on their file extensions.

## Features

* Automatically creates folders named after file extensions (e.g., `txt`, `dart`).
* Moves files into their respective extension-based folders.
* Files without an extension are moved into an `others` folder.
* Built-in tests using the `test` package to ensure correct organization.

## Prerequisites

* Dart SDK (>=2.12.0 <3.0.0)
* `path` package (included in `pubspec.yaml`)
* `test` package (for running tests)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/file-organizer.git
   cd file-organizer
   ```

2. Install dependencies:

   ```bash
   dart pub get
   ```

## Usage

Run the application with an optional target directory argument. If no directory is provided, the current working directory is used.

```bash
# Organize files in the current directory
dart run bin/main.dart

# Organize files in a specific directory
dart run bin/main.dart /path/to/target/directory
```

### How it works

1. The application scans the target directory for all files.
2. For each file, it extracts the file extension.
3. Creates a folder named after the extension (or `others` if no extension).
4. Moves the file into the corresponding folder.

## Example

Before:

```
project/
├── document.txt
├── script.dart
└── image
```

After:

```
project/
├── txt/
│   └── document.txt
├── dart/
│   └── script.dart
└── others/
    └── image
```

## Running Tests

Tests are implemented using the `test` package. They verify that files are moved correctly and that directories are created.

```bash
dart run test
```

## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Make your changes and commit: `git commit -m "Add feature"`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.
