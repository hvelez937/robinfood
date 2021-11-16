import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinfood/biblioteca/provider/biblioteca_provider.dart';
import 'package:robinfood/main/constantes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    obtenerParametros();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<BibliotecaProvider>(context, listen: false)..init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
            width: 300,
            height: 350,
            child: Column(
              children: [
                CircularProgressIndicator(
                  backgroundColor: secundaryColor,
                ),
                Spacer(),
                Text(
                  "Bienvenido a nuestra Biblioteca Virtual!",
                  style: TextStyle(fontSize: 30, color: secundaryColor),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.code,
                      color: secundaryColor,
                    ),
                    Text(
                      " powered by ",
                      style: TextStyle(
                        color: secundaryColor,
                      ),
                    ),
                    Text(
                      "Robin Food",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: secundaryColor,
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  obtenerParametros() async {
    Future.delayed(Duration(seconds: 4), () {
      //Aqui se llaman las api para obtener los parametros

      //Despues de cargar los datos se pasa al enrolamiento
      Navigator.of(context).pushNamedAndRemoveUntil("/libro", (route) => false);
    });
  }
}
