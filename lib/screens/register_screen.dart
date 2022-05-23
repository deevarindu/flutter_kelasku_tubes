import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/user_model.dart';
import 'package:flutter_kelasku_tubes/screens/home_screen.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/widgets/classes_dropdown_widget.dart';

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
  String email = '';

  void _hidePassword() {
    setState(() {
      _visible = !_visible;
    });
  }

  String selectedDropdown = "Pilih Kelas";

  List<String> classes = [
    "Pilih Kelas",
    "12-MM 1",
    "12-MM 2",
    "12-MM 3",
  ];

  void onDropdownChanged(String? value) {
    return setState(() {
      selectedDropdown = value.toString();
      _classController = TextEditingController(text: selectedDropdown);
    });
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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
                                builder: (context) => LoginScreen1(),
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
                            color: Color.fromARGB(255, 230, 81, 0),
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
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          validator: (value){
                              if(value!.isEmpty)
                              {
                                return 'Please enter name';
                              }
                              return null;
                            },
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClassesDropdown(
                              selectedDropdown: selectedDropdown,
                              listItem: classes,
                              onDropdownChanged: onDropdownChanged,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            validator: (value){
                                if(value!.isEmpty){
                                  return 'Please enter email';
                                }
                                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                  return 'Please enter email valid';
                                }
                                  return null;
                              },
                              onSaved: (value){
                                email = value!;
                        },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: const Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 230, 81, 0),)
                              ),
                              obscureText: _visible,
                              onTap: _hidePassword,
                              validator: (value){
                              if(value!.isEmpty)
                              {
                                return 'Please enter password';
                              }
                              else if (value.length > 7 || value.length < 5)
                              {
                                return 'Password must be 6 character';
                              }
                              return null;
                            },
                            ),
                          
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    TextButton(
                    onPressed: () {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ),
                  ),
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
