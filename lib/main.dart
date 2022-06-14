import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const App());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) => NotesOperation(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
