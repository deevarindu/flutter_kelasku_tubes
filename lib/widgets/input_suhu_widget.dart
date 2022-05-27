import 'package:flutter/material.dart';

class inputSuhu extends StatelessWidget {
  const inputSuhu({Key? key, required this.inputCelcius}) : super(key: key);

  final TextEditingController inputCelcius;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputCelcius,
      decoration: InputDecoration(
        labelText: 'Celcius',
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        hintText: 'Masukkan Suhu dalam Celcius',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
