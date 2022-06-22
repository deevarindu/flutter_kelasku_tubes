import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';

class KelasBahasaIndonesia extends StatelessWidget {
  const KelasBahasaIndonesia({Key? key}) : super(key: key);

//MASIH ERROR YAK GES YAK

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: KelasBIList.length,
            itemBuilder: (context, index) {
              final KelasBI kelasBi = KelasBIList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Stack(children: <Widget>[
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(kelasBi.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                          ),
                          child: Center(
                            child: Text(
                              kelasBi.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
