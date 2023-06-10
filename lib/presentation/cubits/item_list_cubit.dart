import 'package:devpace/application/utils/logger.dart';
import 'package:devpace/data/repositories/item/item_repository.dart';
import 'package:devpace/presentation/states/item_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListCubit extends Cubit<ItemListState> {
  final ItemRepository _repository;

  ItemListCubit(this._repository) : super(const ItemListState());

  Future<void> generate() async {
    emit(const ItemListState());
    try {
      await _repository.generate();
    } catch (e) {
      logger.e(e);
      emit(ItemListState(errorMessage: e.toString()));
    }
  }

  Future<void> fetchAll() async {
    emit(const ItemListState(isLoading: true));
    try {
      final list = await _repository.fetchAll();
      emit(ItemListState(
        isLoading: false,
        list: list,
        errorMessage: list.isEmpty ? 'Sorry, item list is empty' : null,
      ));
    } catch (e) {
      emit(ItemListState(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void create() async {
    emit(ItemListState(
      isLoading: true,
      list: state.list,
    ));

    try {
      await _repository.create();
      final list = await _repository.fetchAll();
      emit(ItemListState(
        isLoading: false,
        list: list,
      ));
    } catch (e) {
      emit(ItemListState(
        isLoading: false,
        list: state.list,
        errorMessage: e.toString(),
      ));
    }
  }

  void remove() async {
    if (state.list.isEmpty) return;
    emit(ItemListState(
      isLoading: true,
      list: state.list,
    ));
    try {
      final index = state.list.length - 1;
      await _repository.remove(index);
      final list = await _repository.fetchAll();
      emit(ItemListState(
        isLoading: false,
        list: list,
      ));
    } catch (e) {
      emit(ItemListState(
        isLoading: false,
        list: state.list,
        errorMessage: e.toString(),
      ));
    }
  }
}
