import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonPersonalizado extends StatelessWidget {
  final String? texto;
  final double? ancho;
  final double? alto;
  final IconData? icono;
  final Color color;
  final Function()? onChanged;

  const BotonPersonalizado({
    super.key,
    this.texto = "Boton",
    this.ancho = 60,
    this.alto = 20,
    this.icono = FontAwesomeIcons.a,
    this.onChanged,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        width: ancho,
        height: alto,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.80,
                  height: constraints.maxHeight,
                  child: Center(
                    child: Text(
                      texto ?? "",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              icono == null
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: constraints.maxWidth * 0.15,
                        height: constraints.maxHeight * 0.90,
                        child: const Icon(
                          FontAwesomeIcons.rightToBracket,
                          color: Colors.black54,
                        ),
                      ),
                    )
            ],
          );
        }),
      ),
    );
  }
}
