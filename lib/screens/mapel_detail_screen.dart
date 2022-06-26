import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MapelDetailScreen extends StatefulWidget {
  MapelDetailScreen({
    Key? key,
    this.mapel,
  }) : super(key: key);

  Mapel? mapel;

  @override
  State<MapelDetailScreen> createState() => _MapelDetailScreenState();
}

class _MapelDetailScreenState extends State<MapelDetailScreen> {
  late Future<List<Bab>> futureBabs;

  int? kelas;

  final String Url = 'http://kelasku.test/api/babs';
  Future<List<Bab>> fetchBab() async {
    var url = '$Url';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    List bab = jsonDecode(response.body)['data'];

    return bab.map((babs) => Bab.fromJson(babs)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureBabs = fetchBab();
    kelas = widget.mapel!.kelas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.mapel!.nama_mapel!,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Bab>>(
          future: futureBabs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Bab bab = snapshot.data![index];
                  return ListTile(
                    title: Text(bab.judul_bab),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Data Belum Masuk");
            }
            return Center(child: Text("Load Bab"));
          },
        ),
      ),
    );
  }
}
