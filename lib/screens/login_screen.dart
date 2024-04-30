import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/modelo/models.dart';

import '../Services/services.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final usuariosService = Provider.of<UsuarioService>(context);
    var pantalla = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: pantalla.width,
              height: pantalla.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black38]),
                  image: DecorationImage(
                    alignment: AlignmentDirectional.topStart,
                    image: AssetImage(
                        'assets/imgbackgrounds/background_login.jpg'),
                    fit: BoxFit.fitWidth,
                  )),
              child: Form(
                child: Column(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Taxi- App",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    CajaTextoPersonalizada(
                                      label: "Correo electronico",
                                      hint: "Correo electronico",
                                      icono: FontAwesomeIcons.envelope,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      label: "Contraseña",
                                      hint: "Contraseña",
                                      icono: FontAwesomeIcons.lock,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotonPersonalizado(
                                ancho: constraints.maxWidth * 0.75,
                                alto: constraints.maxHeight * 0.22,
                                color: Colors.black54,
                                icono: FontAwesomeIcons.a,
                                texto: "Ingresar",
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "¿Aun no tiene una cuenta - ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          usuariosService.selectedUsuario = new Usuario(
                                            apellidos: "", 
                                            clave: "", 
                                            correo: "", 
                                            domicilio: "", 
                                            fecha: "", 
                                            nombres: "",   
                                            rol:"", 
                                            telefono: "",                                            
                                            );

                                            context.push('/register');
                                        },                                        
                                        child: const Text(
                                          "Registrate",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
