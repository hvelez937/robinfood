import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robinfood/biblioteca/apis/api_biblioteca.dart';
import 'package:robinfood/biblioteca/modelo/mod_biblioteca.dart';

class BibliotecaProvider extends ChangeNotifier {
  late String mensaje;
  var listaEntrada = [];
  late Detalle detalle;
  List<Favoritos> listaFavoritos = [];

  void init() async {}

  resetEntrada() {
    listaEntrada = [];
    notifyListeners();
  }

  insert(Libro libro) {
    listaEntrada.add(libro);
    notifyListeners();
  }

  insertFavorito(Favoritos favorito) {
    listaFavoritos.add(favorito);
    notifyListeners();
  }

  cargardetalle(String keybook) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //Se valida conexion a internet
    if (connectivityResult != ConnectivityResult.none) {
      mensaje = "Enviando datos";
      notifyListeners();
      //Se llama el api
      BibliotecaApi().consultaDetalle(keybook);
    }
  }

  cargarlista(String urlbook) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //Se valida conexion a internet
    if (connectivityResult != ConnectivityResult.none) {
      mensaje = "Enviando datos";
      notifyListeners();
      //Se llama el api
      BibliotecaApi().consultaLibros(urlbook).then((listaLibros) {
        listaLibros.forEach((libros) => insert(libros));
        mensaje = "Se realizo la sincronizacion correctamente!";
        notifyListeners();
      }).catchError((e) {
        mensaje = "No se lograron enviar los datos de la api";
        notifyListeners();
      });
    }
  }
}
