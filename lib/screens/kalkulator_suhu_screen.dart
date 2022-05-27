import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';

class KalkulatorSuhuScreen extends StatefulWidget {
  const KalkulatorSuhuScreen({Key? key}) : super(key: key);

  @override
  State<KalkulatorSuhuScreen> createState() => _KalkulatorSuhuScreenState();
}

class _KalkulatorSuhuScreenState extends State<KalkulatorSuhuScreen> {
  TextEditingController inputCelcius = TextEditingController();

  List<String> listItem = [
    "Kelvin",
    "Reamur",
    "Fahrenheit",
  ];

  String selectedDropdown = "Kelvin";
  double hasilKonversi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
    );
  }
}
