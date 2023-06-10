part of '../main_page.dart';

class _ItemsGridWidget extends StatelessWidget {
  final List<Item> items;
  final EdgeInsets padding;
  final double height;
  const _ItemsGridWidget({
    required this.items,
    this.padding = EdgeInsets.zero,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.count(
        mainAxisSpacing: kDefaultGridAxisSpacing,
        crossAxisSpacing: kDefaultGridAxisSpacing,
        padding: padding,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: kRrowPerLine,
        childAspectRatio: kDefaultGridAspectRatio,
        children: items.map<Widget>((item) => ItemCard(title: item.title)).toList(),
      ),
    );
  }
}
