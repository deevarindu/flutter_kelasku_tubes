import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String nama = 'Deeva Rindu Wijarista P';
  String kelas = '7A';
  String email = 'Email@gmail.com';
  String password = '121212';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            title(),
            PopupMenuButton<String>(
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(
                nama: nama, kelas: kelas, email: email, password: password),
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 30),
              child: const Text(
                'Pelajaranku',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
