import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Text(
        'Some error text',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
