import 'package:devpace/data/models/item.dart';

abstract class ItemRepository {
  Future<void> generate();
  Future<List<Item>> fetchAll();
  Future<void> create();
  Future<void> remove(int index);
}
