import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:devpace/application/assets/assets.dart';
import 'package:devpace/application/constants/constants.dart';
import 'package:devpace/application/utils/logger.dart';
import 'package:devpace/application/utils/measure.dart';
import 'package:devpace/application/utils/snackbar.dart';
import 'package:devpace/data/models/item.dart';
import 'package:devpace/data/repositories/item/item_repository_impl.dart';
import 'package:devpace/data/sources/local/local_source_impl.dart';
import 'package:devpace/presentation/cubits/item_list_cubit.dart';
import 'package:devpace/presentation/states/item_list_state.dart';
import 'package:devpace/presentation/widgets/card/item_card.dart';
import 'package:devpace/presentation/widgets/loader/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/action_buttons_widget.dart';
part 'widgets/items_grid_widget.dart';
part 'widgets/logo_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ItemListCubit _itemListCubit;

  @override
  void initState() {
    super.initState();
    _itemListCubit = ItemListCubit(ItemRepositoryImpl(LocalSourceImpl()));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _itemListCubit
        ..generate()
        ..fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    const gridPadding = EdgeInsets.all(kDefaultGridAxisSpacing);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _ActionButtonsWidget(
        onPressedDelete: _itemListCubit.remove,
        onPressedAdd: _itemListCubit.create,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(builder: (context, constraints) {
          return BlocProvider(
            create: (_) => _itemListCubit,
            child: BlocConsumer<ItemListCubit, ItemListState>(
              listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
              listener: (_, state) => _showErrorMessage(state.errorMessage),
              builder: (context, state) {
                final list = state.list;
                final gridHeight = measureGridHeight(
                  list.length,
                  gridPadding,
                  constraints.maxWidth,
                );
                return LoaderWidget(
                  isLoading: state.isLoading,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _LogoWidget(
                            height: constraints.maxHeight - gridHeight,
                          ),
                          _ItemsGridWidget(
                            height: gridHeight,
                            padding: gridPadding,
                            items: list,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  void _showErrorMessage(String? message) {
    if (message == null || message.isEmpty) return;
    showReasonMessage(context, reason: message);
  }
}
