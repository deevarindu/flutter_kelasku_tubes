import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/mapel_data.dart';
import 'package:flutter_kelasku_tubes/screens/kalender.dart';
import 'package:flutter_kelasku_tubes/screens/kalkulator_suhu_screen.dart';
import 'package:flutter_kelasku_tubes/screens/note_screen.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String nama = 'Deeva Rindu Wijarista P';
  String kelas = '7';
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
              leading: const Icon(Icons.note),
              title: const Text('Catatan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Kalender'),
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
              leading: const Icon(Icons.calculate),
              title: const Text('Kalkulator Suhu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KalkulatorSuhuScreen(),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(
              nama: nama, kelas: kelas, email: email, password: password),
          Container(
            margin: const EdgeInsets.only(bottom: 15, left: 30),
            child: const Text(
              'Pelajaranku',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: MapelDataList.length,
                itemBuilder: (context, index) {
                  final MapelData mapel = MapelDataList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Stack(children: <Widget>[
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(mapel.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:3.0),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: MediaQuery.of(context).size.height * 0.37,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black38,
                                
                              ),
                              child: Center(
                                child: Text(
                                  mapel.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: SizedBox(
          //         height: 100,
          //         child: GridView.count(
          //           crossAxisCount: 2,
          //           children: [
          //             const CustomCard(
          //                 judul: "Matematika",
          //                 gambar:
          //                     'https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg'),
          //             Padding(
          //               padding: const EdgeInsets.only(top: 30, right: 20),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   TextButton(
          //                     child: const Text('Lihat Latihan Soal ->'),
          //                     onPressed: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) => const Matematika(),
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const CustomCard(
          //                 judul: "Bahasa Indonesia",
          //                 gambar:
          //                     'https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg'),
          //             Padding(
          //               padding: const EdgeInsets.only(top: 30, right: 20),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   TextButton(
          //                     child: const Text('Lihat Latihan Soal ->'),
          //                     onPressed: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) => const NoteScreen(),
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const CustomCard(
          //                 judul: "Bahasa Inggris",
          //                 gambar:
          //                     'https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg'),
          //             Padding(
          //               padding: const EdgeInsets.only(top: 30, right: 20),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   TextButton(
          //                     child: const Text('Lihat Latihan Soal ->'),
          //                     onPressed: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) => const NoteScreen(),
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
