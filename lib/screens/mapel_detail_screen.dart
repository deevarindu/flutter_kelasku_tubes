import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MapelDetailScreen extends StatefulWidget {
  MapelDetailScreen({
    Key? key,
    this.id,
    this.kelas,
    this.nama_mapel,
  }) : super(key: key);

  final int? id;
  final String? kelas;
  final String? nama_mapel;

  @override
  State<MapelDetailScreen> createState() => _MapelDetailScreenState();
}

class _MapelDetailScreenState extends State<MapelDetailScreen> {
  late Future<List<SubBab>> futureMapels;

  final String Url = 'http://kelasku.test/api/subbabs';
  Future<List<SubBab>> fetchMapel() async {
    var url = '$Url';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    // print(response.body);

    List subbab = jsonDecode(response.body)['data'];

    return subbab.map((sub_babs) => SubBab.fromJson(sub_babs)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureMapels = fetchMapel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nama_mapel!,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<SubBab>>(
          future: futureMapels,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  SubBab subbab = snapshot.data![index];
                  return ListTile(
                    title: Text(subbab.judul_sub_bab),
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
