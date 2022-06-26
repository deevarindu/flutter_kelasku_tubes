import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.nama,
    this.kelas,
    this.email,
    this.password,
  }) : super(key: key);

  String? nama;
  int? kelas;
  String? email;
  String? password;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? nama;
  int? kelas;
  String? email;
  String? password;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<Mapel>> futureMapels;
  final String Url = 'http://kelasku.test/api/mapels';

  Future<List<Mapel>> fetchMapel() async {
    var url = '$Url';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    // print(response.body);

    List mapel = jsonDecode(response.body)['data'];

    return mapel.map((mapels) => Mapel.fromJson(mapels)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureMapels = fetchMapel();
    nama = widget.nama;
    kelas = widget.kelas;
    email = widget.email;
    password = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
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
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 56),
              child: title(),
            ),
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
              nama: nama!, kelas: kelas!, email: email!, password: password!),
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
              child: FutureBuilder<List<Mapel>>(
                future: futureMapels,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: MapelDataList.length,
                      itemBuilder: (context, index) {
                        Mapel mapel = snapshot.data![index];
                        final MapelData mpl = MapelDataList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MapelDetailScreen(mapel: mapel);
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Stack(children: <Widget>[
                              Positioned(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(mpl.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.37,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black38,
                                      ),
                                      child: Center(
                                        child: Text(
                                          mapel.nama_mapel!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
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
                    );
                  }
                  return Center();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
