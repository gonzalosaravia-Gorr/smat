class Estacion {
  final int? id;
  final String nombre;
  final String ubicacion;

  Estacion({
    this.id,
    required this.nombre,
    required this.ubicacion,
  });

  // 🔄 Convertir JSON → objeto
  factory Estacion.fromJson(Map<String, dynamic> json) {
    return Estacion(
      id: json['id'],
      nombre: json['nombre'],
      ubicacion: json['ubicacion'],
    );
  }

  // 🔄 Convertir objeto → JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'ubicacion': ubicacion,
    };
  }
}
