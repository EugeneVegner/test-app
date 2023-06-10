import 'package:devpace/application/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showReasonMessage(BuildContext context, {required String reason}) {
  _show(
    context,
    message: reason,
    color: Theme.of(context).colorScheme.error,
    icon: Icons.warning,
  );
}

void showErrorMessage(BuildContext context, {required Error error}) {
  _show(
    context,
    message: error.toString(),
    color: Theme.of(context).colorScheme.error,
    icon: Icons.error,
  );
}

void showInfoMessage(BuildContext context, {required String reason}) {
  _show(
    context,
    message: reason,
    color: Theme.of(context).colorScheme.background,
    icon: Icons.info,
  );
}

void _show(
  BuildContext context, {
  required String message,
  required Color color,
  required IconData icon,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
    elevation: 0,
    content: SizedBox(
      height: 44,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                  ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    ),
    padding: const EdgeInsets.all(4),
    dismissDirection: DismissDirection.up,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: CupertinoColors.extraLightBackgroundGray,
    shape: null,
    onVisible: () {
      logger.d('On Close');
    },
    action: null,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
