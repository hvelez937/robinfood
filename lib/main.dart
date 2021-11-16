import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinfood/biblioteca/provider/biblioteca_provider.dart';
import 'package:robinfood/main/splash.dart';
import 'main/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => BibliotecaProvider()..init()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false, // eliminar banner
          title: 'Robin Food',
          home: FutureBuilder(
            // future: _initHive(context),
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.done) {
              //   if (snapshot.error != null) {
              //     return Center(
              //       child: Text(snapshot.error),
              //     );
              //   } else {
              //     return LoginPage();
              //   }
              // }
              // else {
              return SplashPage();
              // return Scaffold(
              //   body: Center(
              //     child: Text(
              //       "powered by Mitra",
              //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // );
              //  }
            },
          ),
          routes: buildAppRoutes(),
        ));
  }
}
