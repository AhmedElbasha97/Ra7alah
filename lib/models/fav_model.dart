// To parse this JSON data, do
//
//     final favorite = favoriteFromJson(jsonString);

class Favorite {
  Favorite({
    this.name,
    this.description,
    this.images,
    this.locations,
    this.type,
    this.zone,
  });

  String? name;
  String? description;
  List<String>? images;
  List<String>? locations;
  String? type;
  String? zone;
  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    name: json["Name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    locations: List<String>.from(json["locations"].map((x) => x)),
    type: json["type"],
    zone: json["zone"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "description": description,
    "images": List<dynamic>.from(images??[].map((x) => x)),
    "locations": List<dynamic>.from(locations??[].map((x) => x)),
    "type": type,
    "zone": zone,
  };
}
