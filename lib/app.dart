import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/screens/kalkulator_suhu_screen.dart';

import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelasku',
      theme: ThemeData(
        textTheme: GoogleFonts.beVietnamProTextTheme(),
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
//<<<<<<< master
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/kalkulatorSuhu': (context) => const KalkulatorSuhuScreen(),
      },

      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
