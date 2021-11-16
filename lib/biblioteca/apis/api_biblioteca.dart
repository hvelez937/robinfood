import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:robinfood/biblioteca/modelo/mod_biblioteca.dart';

class BibliotecaApi {
  Future<List<Libro>> consultaLibros(String urlbook) async {
    var respuesta = await http
        .get(Uri.parse("http://openlibrary.org/search.json?q=$urlbook"));

    Iterable objeto = convert.json.decode(respuesta.body)["docs"];

    if (respuesta.statusCode == 200) {
      print(respuesta.body);
      return objeto
          .map((libroRecibido) => Libro.fromJson(libroRecibido))
          .toList();
    } else {
      throw Exception("No se logro cargar el api de libros");
    }
  }

  Future<Detalle> consultaDetalle(String keybook) async {
    var respuesta =
        await http.get(Uri.parse("https://openlibrary.org$keybook.json"));

    if (respuesta.statusCode == 200) {
      print(respuesta.body);
      return Detalle.fromJson(json.decode(respuesta.body));
    } else {
      throw Exception("No se logro cargar el api detalle de libros");
    }
  }
}
