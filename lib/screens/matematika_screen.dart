import 'package:flutter/material.dart';

class Matematika extends StatelessWidget {
  const Matematika({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('KelasKu'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Matematika'),
            SizedBox(
              height: 10,
            ),
            Image.asset('/assets/images/no1_MatSoal.png'),
          ],
        ),
      ),
    );
  }
}
