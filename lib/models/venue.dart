class VenueModel {
  late String country;
  late String city;
  late String stadium;
  late String image;

  VenueModel({
    required this.country,
    required this.city,
    required this.stadium,
    required this.image,
  });

  // JSON to Dart Object

  factory VenueModel.fromJSON(Map<String, dynamic> map) {
    return VenueModel(
      country: map['country'],
      city: map['city'],
      stadium: map['stadium'],
      image: map['image'],
    );
  }
}
