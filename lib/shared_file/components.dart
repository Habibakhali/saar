import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message,
    {bool isCancellable = true}) {
  showDialog(
      context: context,
      barrierDismissible: isCancellable,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(message),
              SizedBox(
                width: 5,
              ),
              const CircularProgressIndicator()
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}

void showMessage(BuildContext context, String message, VoidCallback action) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('$message 🎉'),
            actions: [
              TextButton(onPressed: action, child: Text('تـم')),
            ]);
      });
}
