import 'package:devpace/application/constants/constants.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoaderWidget({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: const Center(
            child: SizedBox(
              width: kLoaderSize,
              height: kLoaderSize,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
