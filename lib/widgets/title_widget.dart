import 'package:flutter/material.dart';

Widget title() {
  return Row(
    children: const [
      Text(
        'Kelas',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      Text(
        'Ku',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    ],
  );
}
