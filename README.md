# import_file

This plugin uses the system file dialog to get a file from other apps or the filesystem. **It is currently Android only!**

It copies the file to your app's temp directory and gives you the path. This way you can read the file with Dart's File class.

## Usage
```
Future<String> ImportFile.importFile(String type)
```
This opens the system dialog and returns the path string on file selection.  
```type``` is a mimetype like "text/html" which defaults to "\*/*"

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
