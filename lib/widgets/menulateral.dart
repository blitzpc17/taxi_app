import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menulateral extends StatefulWidget {
  const Menulateral({super.key});

  @override
  State<Menulateral> createState() => _MenulateralState();
}

class _MenulateralState extends State<Menulateral> {
  int _seleccion = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.black38]),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.25,
                child: LayoutBuilder(builder: (context, constraints2) {
                  return Column(
                    children: [
                      const Expanded(
                        child: Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://static.wikia.nocookie.net/logopedia/images/3/3a/1024x1024bb.jpg"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: constraints2.maxWidth,
                            height: constraints2.maxHeight * 0.40,
                            child: const Center(
                              child: Text(
                                "Bienvenido Pedro Valentin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.0005,
                color: Colors.white,
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.60,
                child: ListView(
                  padding: const EdgeInsets.all(7),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: _seleccion == 0
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.house,
                          color: Colors.white,
                          size: 20,
                        ),
                        title: const Text(
                          'Inicio',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        selected: _seleccion == 0,
                        onTap: () => selectDestination(0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: _seleccion == 1
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.clockRotateLeft,
                          color: Colors.white,
                          size: 20,
                        ),
                        title: const Text(
                          'Historial de viajes',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        selected: _seleccion == 1,
                        onTap: () => selectDestination(1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.0005,
                color: Colors.white,
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.10,
                child: ListView(
                  padding: const EdgeInsets.all(7),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: _seleccion == 2
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.rightFromBracket,
                          color: Colors.white,
                          size: 20,
                        ),
                        title: const Text(
                          'Cerrar sesión',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        selected: _seleccion == 2,
                        onTap: () => selectDestination(2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _seleccion = index;
    });
  }
}
