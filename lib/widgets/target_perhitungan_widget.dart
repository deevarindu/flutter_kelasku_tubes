import 'package:flutter/material.dart';

class TargetPerhitungan extends StatelessWidget {
  const TargetPerhitungan({
    Key? key,
    required this.selectedDropdown,
    required this.listItem,
    required this.onDropdownChanged,
    required this.konversi,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listItem;
  final Function onDropdownChanged;
  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedDropdown,
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        );
      }).toList(),
      onChanged: (value) {
        onDropdownChanged(value);
        konversi();
      },
    );
  }
}
