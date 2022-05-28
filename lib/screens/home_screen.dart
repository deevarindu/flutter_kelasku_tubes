import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/screens/kalender.dart';
import 'package:flutter_kelasku_tubes/screens/kalkulator_suhu_screen.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String nama = 'Deeva Rindu Wijarista P';
  String kelas = '7A';
  String email = 'Email@gmail.com';
  String password = '121212';

   var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Catatan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Kalender'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => KalenderApp(),
          ),
        );
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Kalkulator Suhu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => KalkulatorSuhuScreen(),
          ),
        );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            title(),
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'Logout') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: const TextStyle(fontSize: 14),
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
              margin: const EdgeInsets.only(bottom: 15, left: 30),
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
