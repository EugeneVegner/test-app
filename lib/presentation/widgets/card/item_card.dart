import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  const ItemCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }
}
