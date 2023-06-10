part of '../main_page.dart';

class _ActionButtonsWidget extends StatelessWidget {
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedAdd;
  const _ActionButtonsWidget({
    required this.onPressedDelete,
    required this.onPressedAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
        onPressed: onPressedAdd,
        heroTag: null,
        child: const Icon(Icons.add),
      ),
      const SizedBox(height: 10),
      FloatingActionButton(
        onPressed: onPressedDelete,
        heroTag: null,
        child: const Icon(Icons.delete),
      )
    ]);
  }
}
