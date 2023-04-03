import 'package:flutter/material.dart';

Future<bool> buildAlertDialog(BuildContext context, Widget content) async {
  return await showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    useRootNavigator: false,
    context: context,
    builder: (context) => AlertDialog(
      content: content,
    ),
  );
}
