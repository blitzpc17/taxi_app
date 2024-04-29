import 'dart:convert';

class Usuario {
    String apellidos;
    String? avatar;
    String clave;
    String correo;
    String domicilio;
    String fecha;
    String? modelo;
    String nombres;
    String? placa;
    String rol;
    String telefono;

    Usuario({
        required this.apellidos,
        this.avatar,
        required this.clave,
        required this.correo,
        required this.domicilio,
        required this.fecha,
        this.modelo,
        required this.nombres,
        this.placa,
        required this.rol,
        required this.telefono,
    });

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        apellidos: json["Apellidos"],
        avatar: json["Avatar"],
        clave: json["Clave"],
        correo: json["Correo"],
        domicilio: json["Domicilio"],
        fecha: json["Fecha"],
        modelo: json["Modelo"],
        nombres: json["Nombres"],
        placa: json["Placa"],
        rol: json["Rol"],
        telefono: json["Telefono"],
    );

    Map<String, dynamic> toMap() => {
        "Apellidos": apellidos,
        "Avatar": avatar,
        "Clave": clave,
        "Correo": correo,
        "Domicilio": domicilio,
        "Fecha": fecha,
        "Modelo": modelo,
        "Nombres": nombres,
        "Placa": placa,
        "Rol": rol,
        "Telefono": telefono,
    };
}
