class MatchModel {
  late String date;
  late String teamOne;
  late String teamTwo;
  late String flagOne;
  late String flagTwo;
  late String group;
  late String venue;
  late String number;

  MatchModel({
    required this.date,
    required this.teamOne,
    required this.teamTwo,
    required this.flagOne,
    required this.flagTwo,
    required this.venue,
    required this.number,
  });

  // Json to Dart Object

  factory MatchModel.fromJSON(Map<String, dynamic> map) {
    return MatchModel(
      date: map['date'],
      teamOne: map['teamOne'],
      teamTwo: map['teamTwo'],
      flagOne: map['flagOne'],
      flagTwo: map['flagTwo'],
      venue: map['venue'],
      number: map['number'],
    );
  }
}
