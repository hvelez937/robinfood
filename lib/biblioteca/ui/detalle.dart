import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robinfood/biblioteca/modelo/mod_biblioteca.dart';
import 'package:robinfood/biblioteca/provider/biblioteca_provider.dart';
import 'package:robinfood/main/constantes.dart';

class DetallePage extends StatefulWidget {
  DetallePage({Key? key, required this.post}) : super(key: key);

  final Future<Detalle> post;
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;

    var biblioteca = Provider.of<BibliotecaProvider>(context);
    return Center(
      child: FutureBuilder<Detalle>(
        future: widget.post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: nearlyWhite,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.3,
                          child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/2038/2038116.png'),
                        ),
                      ],
                    ),
                    Positioned(
                      top: (MediaQuery.of(context).size.width / 1.3) - 24.0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: nearlyWhite,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: SingleChildScrollView(
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: infoHeight,
                                  maxHeight: tempHeight > infoHeight
                                      ? tempHeight
                                      : infoHeight),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 32.0, left: 18, right: 16),
                                    child: Text(
                                      snapshot.data!.title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                        letterSpacing: 0.27,
                                        color: darkerText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 8,
                                        top: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Version  ',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 22,
                                                  letterSpacing: 0.27,
                                                  color: nearlyBlue,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.latestrevision
                                                    .toString(),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 22,
                                                  letterSpacing: 0.27,
                                                  color: grey,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: nearlyBlue,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity: opacity2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 8,
                                            bottom: 8),
                                        child: Text(
                                          snapshot.data!.description!,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 14,
                                            letterSpacing: 0.27,
                                            color: grey,
                                          ),
                                          maxLines: 30,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.bottom,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top:
                          (MediaQuery.of(context).size.width / 1.2) - 20.0 - 30,
                      right: 10,
                      child: ScaleTransition(
                        alignment: Alignment.center,
                        scale: CurvedAnimation(
                            parent: animationController!,
                            curve: Curves.fastOutSlowIn),
                        child: Card(
                          color: nearlyBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          elevation: 10.0,
                          child: Container(
                            width: 60,
                            height: 60,
                            child: InkWell(
                              child: Icon(
                                Icons.favorite,
                                color: nearlyWhite,
                                size: 30,
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        content: StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                          );
                                        }),
                                        title: Text(
                                            'Estas seguro que desas marcar este libro como favorito?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              biblioteca.insertFavorito(
                                                  Favoritos(
                                                      keyfavorito: snapshot
                                                          .data!.keydetalle,
                                                      title:
                                                          snapshot.data!.title,
                                                      description: snapshot
                                                          .data!.description));
                                              Navigator.pop(context);
                                            },
                                            child: const Text('ok'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: SizedBox(
                        width: AppBar().preferredSize.height,
                        height: AppBar().preferredSize.height,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
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
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } // Por defecto, muestra un loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
