class RecibirDatos{

  String nombre = '';
  int telefono = 0;
  String mail = '';

  RecibirDatos(this.nombre, this.telefono, this.mail);

  RecibirDatos.fromJson(Map<String, dynamic> json){
    nombre = json['name'];
    telefono = json['telephone'];
    mail = json['email'];
  }
}