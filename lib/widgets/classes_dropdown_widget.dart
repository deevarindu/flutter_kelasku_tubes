import 'package:flutter/material.dart';

class ClassesDropdown extends StatelessWidget {
  const ClassesDropdown({
    Key? key,
    required this.selectedDropdown,
    required this.listItem,
    required this.onDropdownChanged,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listItem;
  final Function onDropdownChanged;

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
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        onDropdownChanged(value);
      },
      
    );
    
  }
}
