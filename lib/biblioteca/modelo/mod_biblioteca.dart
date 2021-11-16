class Libro {
  String keylibro;
  String title;
  bool estado = false;

  Libro({
    required this.keylibro,
    required this.title,
  });

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      keylibro: json['key'],
      title: json['title'],
    );
  }
}

class Detalle {
  String keydetalle;
  String title;
  String? description;
  int? latestrevision;
  // List<Lugares>? lugares;
  // List<Personajes>? personajes;

  Detalle({
    required this.keydetalle,
    required this.title,
    this.description,
    this.latestrevision,
    //  this.lugares,
    //  this.personajes
  });

  factory Detalle.fromJson(Map<String, dynamic> json) {
    return Detalle(
      keydetalle: json['key'],
      title: json['title'],
      description: json['description'],
      latestrevision: json['latest_revision'],
      //   lugares: json['subject_places'],
      //  personajes: json['subject_people'],
    );
  }
}

class Lugares {
  String? descriptionlugar;
  Lugares({
    this.descriptionlugar,
  });
  factory Lugares.fromJson(Map<String, dynamic> json) {
    return Lugares(
      descriptionlugar: json[''],
    );
  }
}

class Personajes {
  String? descriptionpersonaje;
  Personajes({
    this.descriptionpersonaje,
  });
  factory Personajes.fromJson(Map<String, dynamic> json) {
    return Personajes(
      descriptionpersonaje: json[''],
    );
  }
}

class Favoritos {
  String keyfavorito;
  String title;
  String? description;

  Favoritos({
    required this.keyfavorito,
    required this.title,
    this.description,
  });
}
