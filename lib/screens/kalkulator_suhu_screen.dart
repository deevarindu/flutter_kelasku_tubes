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

  void onDropdownChanged(String? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: inputSuhu(inputCelcius: inputCelcius),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          //child: ,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
