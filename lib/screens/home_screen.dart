import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pantalla = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const Menulateral(),
        body: SizedBox(
          width: pantalla.width,
          height: pantalla.height,
        ),
      ),
    );
  }
}
