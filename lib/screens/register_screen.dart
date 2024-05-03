import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/Services/services.dart';
import 'package:taxi_app/modelo/models.dart';
import 'package:taxi_app/providers/usuario_form_provider.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({super.key});
  static const name = 'register_screen';

  @override
  Widget build(BuildContext context) {
    final usuariosServices = Provider.of<UsuarioService>(context);
    final pantalla = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (_) => UsuarioFormProvider(usuariosServices.selectedUsuario),
        child: _RegisterScreenBody(
            pantalla: pantalla, usuariosServices: usuariosServices));
  }
}

class _RegisterScreenBody extends StatefulWidget {
  const _RegisterScreenBody(
      {super.key, required this.pantalla, required this.usuariosServices});

  final Size pantalla;
  final UsuarioService usuariosServices;

  @override
  State<_RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<_RegisterScreenBody> {
  String? perfil = "";

  @override
  Widget build(BuildContext context) {
    //final usuarioForm = Provider.of<UsuarioFormProvider>(context);
    //final usuario = usuarioForm.usuario;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: widget.pantalla.width - (widget.pantalla.width * 0.50),
              child: Container(
                width: widget.pantalla.width * 0.65,
                height: widget.pantalla.height * 0.22,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgbackgrounds/bg_registro.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: widget.pantalla.width,
              height: widget.pantalla.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black26, Colors.black87])),
              child: Form(
                child: Column(
                  children: [
                    Expanded(child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.25,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          child:
                              LayoutBuilder(builder: (context, constraints2) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: constraints2.maxWidth,
                                  height: constraints2.maxHeight * 0.22,
                                  child: const Text(
                                    "Registrate",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints2.maxHeight * 0.10,
                                ),
                                SizedBox(
                                  width: constraints2.maxWidth,
                                  height: constraints2.maxHeight * 0.10,
                                  child: Text(
                                    "Crea una nueva cuenta, es completamente gratis.",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints2.maxHeight * 0.10,
                                ),
                                Container(
                                  width: constraints2.maxWidth,
                                  height: constraints2.maxHeight * 0.40,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonFormField<String>(
                                    value: null,
                                    decoration: const InputDecoration(
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 12),
                                            child: FaIcon(
                                              FontAwesomeIcons.userCheck,
                                              size: 20,
                                            )),
                                        labelText: 'Perfil'),
                                    items: <String>['Usuario', 'Conductor']
                                        .map((e) {
                                      return DropdownMenuItem(
                                          value: e, child: Text(e));
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        perfil = val ?? "";
                                      });
                                    },
                                    padding: const EdgeInsets.all(5),
                                  ),
                                )
                              ],
                            );
                          }),
                        )),
                    Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black45,
                                        radius: 50,
                                        child: Center(
                                          child:
                                              FaIcon(FontAwesomeIcons.pencil),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      // initialValue: usuario.nombres,
                                      label: "Nombre(s)",
                                      // hint: "Nombre(s)",
                                      icono: FontAwesomeIcons.user,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      //  initialValue: usuario.apellidos,
                                      label: "Apellidos",
                                      //  hint: "Apellidos",
                                      icono: FontAwesomeIcons.user,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      //   initialValue: usuario.correo,
                                      label: "Correo electrónico",
                                      //  hint: "Correo electrónico",
                                      icono: FontAwesomeIcons.envelope,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      //   initialValue: usuario.correo,
                                      label: "Contraseña",
                                      //  hint: "Correo electrónico",
                                      icono: FontAwesomeIcons.lock,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CajaTextoPersonalizada(
                                      //    initialValue: usuario.telefono,
                                      label: "Teléfono",
                                      // hint: "Teléfono",
                                      icono: FontAwesomeIcons.phone,
                                    ),
                                    perfil == "Conductor"
                                        ? Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CajaTextoPersonalizada(
                                                  //    initialValue: usuario.telefono,
                                                  label: "Domicilio",
                                                  // hint: "Teléfono",
                                                  icono: FontAwesomeIcons
                                                      .addressCard,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CajaTextoPersonalizada(
                                                  //    initialValue: usuario.telefono,
                                                  label: "Modelo",
                                                  // hint: "Teléfono",
                                                  icono:
                                                      FontAwesomeIcons.carRear,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CajaTextoPersonalizada(
                                                  //    initialValue: usuario.telefono,
                                                  label: "Placas",
                                                  // hint: "Teléfono",
                                                  icono: FontAwesomeIcons
                                                      .circleInfo,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container()
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
                                alto: constraints.maxHeight * 0.35,
                                color: Colors.black54,
                                icono: FontAwesomeIcons.paperPlane,
                                texto: "Registrarse",
                                onChanged: () async {
                                  /*await usuariosServices
                                      .saveOrCreateUsuario(usuarioForm.usuario);*/
                                },
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
