import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/estacion.dart';
import 'auth_service.dart';

class ApiService {
  final String baseUrl = "http://10.0.2.2:8000";

  Future<List<Estacion>> fetchEstaciones() async {
    final response = await http.get(
      Uri.parse('$baseUrl/estaciones/'),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Estacion.fromJson(e)).toList();
  }

  Future<bool> crearEstacion(String nombre, String ubicacion) async {
    final token = await AuthService().getToken();

    final response = await http.post(
      Uri.parse('$baseUrl/estaciones/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'nombre': nombre,
        'ubicacion': ubicacion,
      }),
    );

    return response.statusCode == 200;
  }
}