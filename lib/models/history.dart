class HistoryModel {
  late String winner;
  late String runnerUp;
  late String winnerFlag;
  late String runnerUpFlag;
  late String winnerScore;
  late String runnerUpScore;
  late String host;
  late String year;

  HistoryModel({
    required this.winner,
    required this.runnerUp,
    required this.winnerFlag,
    required this.runnerUpFlag,
    required this.winnerScore,
    required this.runnerUpScore,
    required this.host,
    required this.year,
  });

  factory HistoryModel.fromJSON(Map<String, dynamic> map) {
    return HistoryModel(
      winner: map['winner'],
      runnerUp: map['runnerUp'],
      winnerFlag: map['winnerFlag'],
      runnerUpFlag: map['runnerUpFlag'],
      winnerScore: map['winnerScore'],
      runnerUpScore: map['runnerUpScore'],
      host: map['host'],
      year: map['year'],
    );
  }
}
