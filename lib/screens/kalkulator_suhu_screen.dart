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

  void konversi() {
    return setState(() {
      if (inputCelcius.text.isEmpty) {
        hasilKonversi = 0;
      } else {
        hasilKonversi = double.parse(inputCelcius.text);
        if (selectedDropdown == "Kelvin") {
          hasilKonversi = hasilKonversi + 273.15;
        } else if (selectedDropdown == "Reamur") {
          hasilKonversi = hasilKonversi * 4 / 5;
        } else if (selectedDropdown == "Fahrenheit") {
          hasilKonversi = hasilKonversi * 9 / 5 + 32;
        }
      }
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
                          child: TargetPerhitungan(
                            selectedDropdown: selectedDropdown,
                            listItem: listItem,
                            onDropdownChanged: onDropdownChanged,
                            konversi: konversi,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Hasil",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      PerhitunganTerakhir(hasilKonversi: hasilKonversi),
                    ],
                  ),
                  KonversiSuhu(konversi: konversi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
