import 'package:flutter/material.dart';

void snackbar(String title, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
    content: Text(
      title,
      style: const TextStyle(fontSize: 16),
    ),
  ));
}
