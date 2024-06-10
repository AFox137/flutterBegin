class RecibirDatos{

  String nombre = '';
  String apellido = '';
  String telefono = '';
  String mail = '';

  RecibirDatos(this.nombre, this.apellido, this.telefono, this.mail);

  RecibirDatos.fromJson(Map<String, dynamic> json){
    nombre = json['nombre'];
    apellido = json['apellido'];
    telefono = json['telefono'];
    mail = json['mail'];
  }
}