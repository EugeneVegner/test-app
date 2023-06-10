import 'dart:async';

import 'package:devpace/data/repositories/base/base_repository.dart';
import 'package:devpace/data/repositories/item/item_repository.dart';
import 'package:devpace/data/sources/local/local_source.dart';
import 'package:devpace/data/models/item.dart';

class ItemRepositoryImpl extends BaseRepository implements ItemRepository {
  final LocalSource _source;
  ItemRepositoryImpl(this._source);

  @override
  Future<void> generate() async {
    try {
      await _source.generate();
    } catch (e) {
      handleError(e);
    }
  }

  @override
  Future<List<Item>> fetchAll() async {
    try {
      final list = await _source.fetchAll();
      return list.map((value) => Item(title: value)).toList();
    } catch (e) {
      handleError(e);
      return [];
    }
  }

  @override
  Future<void> create() async {
    try {
      await _source.add();
    } catch (e) {
      handleError(e);
    }
  }

  @override
  Future<void> remove(int index) async {
    try {
      await _source.remove(index);
    } catch (e) {
      handleError(e);
    }
  }
}
