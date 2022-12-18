class TeamsModel {
  late String fullName;
  late String shortName;
  late String captain;
  late String flag;
  late String squad;
  late String captainImage;

  TeamsModel({
    required this.fullName,
    required this.shortName,
    required this.captain,
    required this.squad,
    required this.flag,
    required this.captainImage,
  });

  // Json to Dart object

  factory TeamsModel.fromJSON(Map<String, dynamic> map) {
    return TeamsModel(
      fullName: map['fullName'],
      shortName: map['shortName'],
      squad: map['squad'],
      captain: map['captain'],
      flag: map['flag'],
      captainImage: map['captainImage'],
    );
  }
}
