import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolicitarViajeScreen extends StatefulWidget {
  const SolicitarViajeScreen({super.key});

  @override
  State<SolicitarViajeScreen> createState() => _SolicitarViajeScreenState();
}

class _SolicitarViajeScreenState extends State<SolicitarViajeScreen> {
  var editando = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.black, Colors.black38]),
              ),
            ),
          ),
          drawer: const Menulateral(),
          body: SafeArea(child: Container(
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.10,
                    child: const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Viaje",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.0005,
                    color: Colors.black54,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.80,
                    child: LayoutBuilder(builder: (context, constraints5) {
                      return Stack(children: [
                        SizedBox(
                          width: constraints.maxWidth,
                          height: constraints5.maxHeight,
                          child: const Center(
                            child: Text("Mapa"),
                          ),
                        ),
                        SizedBox(
                          width: constraints5.maxWidth,
                          height: constraints5.maxHeight * 0.18,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CajaTextoPersonalizada(
                                    label: "Tu ubicación actual",
                                    hint: "Tu ubicación actual",
                                    iconoPrefix: FontAwesomeIcons.locationDot,
                                    icono: FontAwesomeIcons.locationDot),
                              ),
                              Expanded(
                                child: CajaTextoPersonalizada(
                                    label:
                                        "Agrega aqui la dirección de destino",
                                    hint: "Agrega aqui la dirección de destino",
                                    iconoPrefix: FontAwesomeIcons.flag,
                                    icono: FontAwesomeIcons.flag),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: constraints5.maxWidth * 0.75,
                            height: constraints5.maxHeight * 0.18,
                            child: Container(
                              child: _tarjetaTipoViaje(
                                  ancho: constraints5.maxWidth * 0.60,
                                  alto: constraints5.maxHeight * 0.25),
                            ),
                          ),
                        )
                      ]);
                    }),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.098,
                      child: LayoutBuilder(
                        builder: (context, constraints12) {
                          return BotonPersonalizado(
                            ancho: constraints12.maxWidth * 0.10,
                            alto: constraints12.maxHeight * 0.35,
                            color: Colors.black,
                            icono: FontAwesomeIcons.circleCheck,
                            texto: "Pedir viaje",
                          );
                        },
                      ))
                ],
              );
            }),
          ))),
    );
  }
}

class _tarjetaTipoViaje extends StatelessWidget {
  final double ancho;
  final double alto;

  const _tarjetaTipoViaje({required this.ancho, required this.alto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        children: [
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Checkbox(value: true, onChanged: null))),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: CircleAvatar(
                  radius: 22,
                  backgroundImage:
                      AssetImage("assets/imgbackgrounds/bg_solicitarviaje.png"),
                )),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Clásico",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Viajes ecónomicos y seguros.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "${56.89}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
