import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class SubBabScreen extends StatefulWidget {
  SubBabScreen({
    Key? key,
    this.bab,
  }) : super(key: key);

  Bab? bab;

  @override
  State<SubBabScreen> createState() => _SubBabScreenState();
}

class _SubBabScreenState extends State<SubBabScreen> {
  late Future<List<SubBab>> futureSubBabs;

  Bab? bab;

  final String Url = 'http://kelasku.test/api/subbabs';
  Future<List<SubBab>> fetchSubBab() async {
    var url = '$Url';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    List subbab = jsonDecode(response.body)['data'];

    return subbab.map((subbabs) => SubBab.fromJson(subbabs)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureSubBabs = fetchSubBab();
    bab = widget.bab!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bab!.judul_bab,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<SubBab>>(
          future: futureSubBabs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  SubBab subBab = snapshot.data![index];
                  if (subBab.id_bab == bab!.id) {
                    return ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MateriScreen(subBab: subBab),
                            ),
                          );
                        },
                        child: Text(
                          subBab.judul_sub_bab,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                  }
                  return Center();
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
