import 'package:flutter/material.dart';
import 'package:taxi_app/modelo/models.dart';

class UsuarioFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Usuario usuario;
  
  UsuarioFormProvider(this.usuario);

  updateAvailability(bool value){
    print(value);
    //this.product.available = value;
    notifyListeners();
  }


  bool isValidForm(){
    return formKey.currentState?.validate()??false;
  }

}