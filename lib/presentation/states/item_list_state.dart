import 'package:devpace/data/models/item.dart';

class ItemListState {
  final bool isLoading;
  final List<Item> list;
  final String? errorMessage;

  const ItemListState({
    this.isLoading = false,
    this.list = const [],
    this.errorMessage,
  });
}
