import 'package:flutter/cupertino.dart';
import 'package:robinfood/biblioteca/ui/favoritos.dart';
import 'package:robinfood/biblioteca/ui/lista_libros.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    '/libro': (BuildContext context) => ListaLibroPage(),
    //  '/detalle': (BuildContext context) => DetallePage(),
    '/favoritos': (BuildContext context) => ListaFavoritoPage(),
  };
}
