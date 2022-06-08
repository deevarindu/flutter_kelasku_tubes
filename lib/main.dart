import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/app.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    const App(),
  );
}
