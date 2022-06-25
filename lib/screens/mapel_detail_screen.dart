import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MapelDetailScreen extends StatelessWidget {
  MapelDetailScreen({
    Key? key,
    this.nama_mapel,
  }) : super(key: key);

  final String? nama_mapel;

  late Future<List<SubBab>> futureMapels;

  Future<List<SubBab>> fetchMapel() async {
    http.Response response = await http.get(
      Uri.parse('http://kelasku.test/api/subbab'),
    );

    List subbab = jsonDecode(response.body)['data'];

    return subbab.map((subbab) => SubBab.fromJson(subbab)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nama_mapel!,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<SubBab>>(
          future: fetchMapel(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.orange),
                    title: Text(snapshot.data[index]['judul_sub_bab']),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
