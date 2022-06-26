import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

class MateriScreen extends StatefulWidget {
  MateriScreen({
    Key? key,
    this.subBab,
  }) : super(key: key);

  SubBab? subBab;

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  late Future<List<SubBab>> futureSubBabs;

  SubBab? subBab;

  @override
  void initState() {
    super.initState();
    subBab = widget.subBab!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subBab!.judul_sub_bab,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(subBab!.isi_sub_bab),
          ],
        ),
      ),
    );
  }
}
