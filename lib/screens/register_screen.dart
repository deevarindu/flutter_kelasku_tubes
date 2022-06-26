import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_kelasku_tubes/service/auth_services.dart';
import 'package:flutter_kelasku_tubes/service/globals.dart';
import 'package:flutter_kelasku_tubes/widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _classController = TextEditingController();

  bool _visible = false;
  final formKey = GlobalKey<FormState>();
  String nama = '';
  late int kelas;
  String email = '';
  String password = '';

  registerPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      http.Response response =
          await AuthServices.register(nama, kelas, email, password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(
                  nama: nama, kelas: kelas, email: email, password: password),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

  void _hidePassword() {
    setState(() {
      _visible = !_visible;
    });
  }

  // String selectedDropdown = "Pilih Kelas";

  // List<String> classes = [
  //   "Pilih Kelas",
  //   "7",
  //   "8",
  //   "9",
  // ];

  // void onDropdownChanged(String? value) {
  //   return setState(() {
  //     selectedDropdown = value.toString();
  //     _classController = TextEditingController(text: selectedDropdown);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 169, 32),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              nama = value;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _classController,
                            decoration: InputDecoration(
                                labelText: 'Class',
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              kelas = int.parse(value);
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please enter email valid';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(
                                  Icons.visibility,
                                  color: Color.fromARGB(255, 255, 169, 32),
                                )),
                            obscureText: _visible,
                            onTap: _hidePassword,
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Button(
                        btnText: "Register",
                        onBtnPressed: () => registerPressed()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
