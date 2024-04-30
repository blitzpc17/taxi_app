
import '../modelo/models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioService extends ChangeNotifier{
  final String _baseUrl = 'prueba23-edf7e-default-rtdb.firebaseio.com';
  final List<Usuario>usuarios = [];

  late Usuario selectedUsuario;
  
  bool isLoading = true;
  bool isSaving = true;


  UsuarioService(){
    this.loadUsuarios();
  }


  Future loadUsuarios() async {
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    final resp = await http.get(url);

    final Map<String, dynamic>usuariosMap = json.decode(resp.body);
    print(usuariosMap);
  }

  Future saveOrCreateUsuario(Usuario usuario) async {
    isSaving = true;
    notifyListeners();

    if(usuario.id == null){
      await this.createUsuario(usuario);
    }else{
      //update
      await this.updateUsuario(usuario);
    }

    isSaving = false;
    notifyListeners();



  }


  Future<String>createUsuario(Usuario usuario) async{
    final DateTime fechaActual = DateTime.now();
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    usuario.fecha = fechaActual.toString();
    final resp = await http.post(url, body: usuario.toJson());
    final decodedData = json.decode(resp.body);   

    usuario.id = decodedData['name'];

    usuarios.add(usuario);
    return usuario.id!;

  }


    Future<String>updateUsuario(Usuario usuario) async{
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    final resp = await http.put(url, body: usuario.toJson());
    final decodedData = resp.body;
    
    final index = this.usuarios.indexWhere((element) => element.id == usuario.id);
    this.usuarios[index] = usuario;

    return usuario.id!;

  }



}