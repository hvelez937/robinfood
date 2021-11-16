import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinfood/biblioteca/apis/api_biblioteca.dart';
import 'package:robinfood/biblioteca/modelo/mod_biblioteca.dart';
import 'package:robinfood/biblioteca/provider/biblioteca_provider.dart';
import 'package:robinfood/biblioteca/ui/detalle.dart';
import 'package:robinfood/main/constantes.dart';

class ListaFavoritoPage extends StatefulWidget {
  ListaFavoritoPage({Key? key}) : super(key: key);

  @override
  _ListaFavoritoPageState createState() => _ListaFavoritoPageState();
}

class _ListaFavoritoPageState extends State<ListaFavoritoPage> {
  late String urlbook;

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var biblioteca = Provider.of<BibliotecaProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(3.0),
        // color: colorcard,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  right: 300.0, top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tus Libros Favoritos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.2,
                          color: grey,
                        ),
                      ),
                      Text(
                        'Biblioteca Virtual',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 0.27,
                          color: darkerText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Image.network(
                      'https://raw.githubusercontent.com/mitesh77/Best-Flutter-UI-Templates/master/best_flutter_ui_templates/assets/design_course/userImage.png'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                    height: 400,
                    width: double.infinity,
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, right: 16, left: 16),
                            itemCount: biblioteca.listaFavoritos.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Favoritos favorito =
                                  biblioteca.listaFavoritos[index];
                              return Card(
                                elevation: 30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.orange,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Center(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.library_books,
                                                color: Colors.black54,
                                                size: 50.0,
                                                semanticLabel:
                                                    'Text to announce in accessibility modes',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Text(favorito.title,
                                                        style: new TextStyle(
                                                            color: Colors.cyan,
                                                            fontSize: 12.0)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}
