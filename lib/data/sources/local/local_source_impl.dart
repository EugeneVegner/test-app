import 'dart:async';

import 'package:devpace/application/exception/custom_exception.dart';
import 'package:devpace/application/utils/logger.dart';
import 'package:devpace/application/utils/scheduler.dart';
import 'package:devpace/data/sources/base/base_source.dart';
import 'package:devpace/data/sources/local/local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSourceImpl extends BaseSource implements LocalSource {
  Future<SharedPreferences> _getPreferences() async => await SharedPreferences.getInstance();
  static const String _stringListKey = 'stringList';

  @override
  Future<void> generate() async {
    try {
      final count = Scheduler.randomValue(min: 0, max: 2);
      logger.d('Random item count: $count');
      final list = List<String>.generate(count, (index) => 'Item ${index + 1}');
      final prefs = await _getPreferences();
      await prefs.setStringList(_stringListKey, list);
    } catch (e) {
      handleError(e);
    }
  }

  @override
  Future<List<String>> fetchAll() async {
    try {
      final prefs = await _getPreferences();
      await Scheduler.randomDelay();
      return prefs.getStringList(_stringListKey) ?? [];
    } catch (e) {
      handleError(e);
      return [];
    }
  }

  @override
  Future<void> add() async {
    try {
      final prefs = await _getPreferences();
      final list = prefs.getStringList(_stringListKey) ?? [];
      list.add('Item ${list.length + 1}');
      await Scheduler.randomDelay();
      await prefs.setStringList(_stringListKey, list);
      // Scheduler.randomFailure()
      //     ? handleError(CustomException('Can\'t add item'))
      //     : await prefs.setStringList(_stringListKey, list);
    } catch (e) {
      logger.e(e);
      handleError(e);
    }
  }

  @override
  Future<void> remove(int index) async {
    try {
      final prefs = await _getPreferences();
      final list = prefs.getStringList(_stringListKey) ?? [];
      if (index < list.length && list.isNotEmpty) {
        list.removeAt(index);
        await Scheduler.randomDelay();
        Scheduler.randomFailure()
            ? handleError(CustomException('Can\'t remove item. Try again'))
            : await prefs.setStringList(_stringListKey, list);
      }
    } catch (e) {
      handleError(e);
    }
  }
}
