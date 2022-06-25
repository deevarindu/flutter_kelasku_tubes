import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MapelDetailScreen extends StatefulWidget {
  MapelDetailScreen({
    Key? key,
    this.nama_mapel,
  }) : super(key: key);

  final String? nama_mapel;

  @override
  State<MapelDetailScreen> createState() => _MapelDetailScreenState();
}

class _MapelDetailScreenState extends State<MapelDetailScreen> {
  late Future<List<SubBab>> futureMapels;
  final String Url = 'http://127.0.0.1:8000/api/subbabs';
  Future<List<SubBab>> fetchMapel() async {
    var url = '$Url';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);
     
    List subbab = jsonDecode(response.body);

    return subbab.map((subbab) => SubBab.fromJson(subbab)).toList();
  }

  @override

  void initState(){
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
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index) {
                  SubBab sub = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.orange),
                    title: Text(sub.judul_sub_bab),
                  );
                },
              );
            } 
            else if(snapshot.hasError){
              return Text("Data Belum Masuk");  
            }
            
            return Center(child:Text("Sorry Error"));
          },
        ),
      ),
    );
  }
}