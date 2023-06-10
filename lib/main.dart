import 'dart:async';

import 'package:devpace/app.dart';
import 'package:devpace/application/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  Logger.level = Level.debug;

  runZonedGuarded(() {
    runApp(const App());
  }, (error, stackTrace) {
    logger.e(error);
  });
}
