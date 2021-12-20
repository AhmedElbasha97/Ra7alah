// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

class Location {
  Location({
    required this.city,
    required this.gov,
    required this.image,
  });

  List<City> city;
  String gov;
  String image;

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: List<City>.from(json["city"].map((x) => City.fromJson(x))),
    gov: json["gov"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "city": List<dynamic>.from(city.map((x) => x.toJson())),
    "gov": gov,
    "image": image,
  };
}

class City {
  City({
     this.description,
     this.location,
     this.name,
     this.type,
     this.zone,
     this.id,
    this.images,
  });

  String? description;
  List<String>? location;
  String? name;
  String? type;
  String? zone;
  String? id;
  List<String>? images;

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
    description: json["Description"],
    location: List<String>.from(json["Location"].map((x) => x)),
    name: json["Name"],
    type: json["Type"] == null ? null : json["Type"],
    zone: json["Zone"],
    id: json["id"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Description": description,
    "Location": List<dynamic>.from(location??[].map((x) => x)),
    "Name": name,
    "Type": type == null ? null : type,
    "Zone": zone,
    "id": id,
    "images": List<dynamic>.from(images??[].map((x) => x)),
  };
}
