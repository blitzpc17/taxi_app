import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeleccionUbicacionScreen extends StatefulWidget {
  final String textoTitulo;
  const SeleccionUbicacionScreen({super.key, required this.textoTitulo});

  @override
  State<SeleccionUbicacionScreen> createState() =>
      _SeleccionUbicacionScreenState();
}

class _SeleccionUbicacionScreenState extends State<SeleccionUbicacionScreen> {
  var editando = false;
  var viajeEncontrado = false;
  late Size _pantalla;

  @override
  Widget build(BuildContext context) {
    _pantalla = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(body: SafeArea(child: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.10,
                child: LayoutBuilder(
                  builder: (context, constraints1) {
                    return Row(
                      children: [
                        Container(
                          height: constraints1.maxHeight,
                          width: constraints1.maxWidth * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.angleLeft,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints1.maxWidth * 0.05,
                        ),
                        SizedBox(
                          height: constraints1.maxHeight,
                          width: constraints1.maxWidth * 0.70,
                          child: const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              maxLines: 12,
                              "Selecciona tu ubicación de partida", //widget.textoTitulo,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.0005,
                color: Colors.black54,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: viajeEncontrado ? 10 : 5),
                width: constraints.maxWidth,
                height: viajeEncontrado
                    ? ((constraints.maxHeight * 0.80) +
                        constraints.maxHeight * 0.098)
                    : constraints.maxHeight * 0.80,
                child: LayoutBuilder(builder: (context, constraints5) {
                  List<Map<String, dynamic>> s = [
                    {
                      "ubicacion": "Av. Reforma",
                      "ubicacionCompleta":
                          "Av. Reforma Centro #90, Tehuacán Pue."
                    },
                    {
                      "ubicacion": "Av. Reforma",
                      "ubicacionCompleta":
                          "Av. Reforma Centro #90, Tehuacán Pue."
                    }
                  ];

                  return Stack(children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: constraints5.maxHeight * 0.10),
                        width: constraints.maxWidth,
                        height: constraints5.maxHeight,
                        child: ListView.builder(
                          itemCount: s.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading:
                                  const FaIcon(FontAwesomeIcons.locationPin),
                              title: Text('${s[index]["ubicacion"]}'),
                              subtitle:
                                  Text("${s[index]["ubicacionCompleta"]}"),
                              trailing: const FaIcon(
                                  FontAwesomeIcons.clockRotateLeft),
                            );
                          },
                        )),
                    SizedBox(
                      width: constraints5.maxWidth,
                      height: constraints5.maxHeight * 0.10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 12,
                            child: CajaTextoPersonalizada(
                                label: "Dirección de destino",
                                hint: "Dirección de destino",
                                iconoPrefix: FontAwesomeIcons.locationDot,
                                icono: FontAwesomeIcons.locationDot),
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {},
                            child: const Center(
                              child: FaIcon(FontAwesomeIcons.circleXmark),
                            ),
                          ))
                        ],
                      ),
                    )
                  ]);
                }),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.098,
                  child: LayoutBuilder(
                    builder: (context, constraints12) {
                      return BotonPersonalizado(
                          ancho: constraints12.maxWidth * 0.10,
                          alto: constraints12.maxHeight * 0.35,
                          color: Colors.black,
                          icono: FontAwesomeIcons.mapLocationDot,
                          anchoIconos: 0.10,
                          altoIconos: 0.75,
                          deshabFondoIconos: true,
                          colorIconos: Colors.grey,
                          texto: "Seleccionar del mapa",
                          onChanged: () {
                            //Aqui se mostrará el mapa
                          });
                    },
                  ))
            ],
          );
        }),
      ))),
    );
  }
}
