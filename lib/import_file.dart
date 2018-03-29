package io.github.lucaslcode.importfile;

import 'dart:async';

import 'package:flutter/services.dart';

class ImportFile {
  static const MethodChannel _channel =
      const MethodChannel('import_file');

  static Future<String> importFile([String type = "*/*"]) =>
    _channel.invokeMethod('importFile',<String, dynamic>{'type': type});
}
