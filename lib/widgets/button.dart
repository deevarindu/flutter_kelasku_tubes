import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;

  const Button(
      {Key? key, required this.btnText, required this.onBtnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 169, 32),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
        ),
      ),      
      child: MaterialButton(
        onPressed: () {
          onBtnPressed();
        },
        child: Text(
          btnText,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
          ),
        ),
      ),
    );
  }
}
