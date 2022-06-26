import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/widgets/title_widget.dart';

class GantiProfilSiswa extends StatefulWidget {
  final index;
  final value;
  GantiProfilSiswa({Key? key, @required this.index, @required this.value})
      : super(key: key);

  @override
  State<GantiProfilSiswa> createState() =>
      _GantiProfilSiswaState(index: index, value: value);
}

class _GantiProfilSiswaState extends State<GantiProfilSiswa> {
  _GantiProfilSiswaState({@required this.index, @required this.value})
      : super();
  @override
  final index;
  final value;

  final namaController = TextEditingController();
  final kelasController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  isDataValid() {
    if (namaController.text.isEmpty) {
      return false;
    }

    if (kelasController.text.isEmpty) {
      return false;
    }

    if (emailController.text.isEmpty) {
      return false;
    }

    if (passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  getData() {
    // jika nilai index dan value yang dikirim dari halaman home tidak null
    // artinya ini adalah operasi update
    // tampilkan data yang dikirim, sehingga user bisa edit
    if (index != null && value != null) {
      setState(() {
        namaController.text = value['nama'];
        kelasController.text = value['kelas'];
        emailController.text = value['email'];
        passwordController.text = value['password'];
      });
    }
  }

  saveData() async {
    if (isDataValid()) {
      var siswa = {
        'nama': namaController.text,
        'kelas': kelasController.text,
        'email': emailController.text,
        'password': passwordController.text
      };

      var savedData = await GantiProfil.getData();

      if (index == null) {
        savedData.insert(0, siswa);
      } else {
        savedData[index] = siswa;
      }

      await GantiProfil.saveData(savedData);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Empty Field'),
            content: Text('Please fill all field.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(),
        backgroundColor: Colors.white,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              saveData();
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama'),
            TextField(
              controller: namaController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text('Kelas'),
            TextField(
              controller: kelasController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text('Email'),
            TextField(
              controller: emailController,
            ),
            Text('Password'),
            TextField(
              controller: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
