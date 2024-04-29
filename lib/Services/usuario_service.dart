
import '../modelo/models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioService extends ChangeNotifier{
  final String _baseUrl = 'prueba23-edf7e-default-rtdb.firebaseio.com';
  final List<Usuario>usuarios = [];


  bool isLoading = true;


  UsuarioService(){
    this.loadUsuarios();
  }


  Future loadUsuarios() async {
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic>usuariosMap = json.decode(resp.body);
    print(usuariosMap);
  }



}