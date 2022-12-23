import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:psl_eight/models/history.dart';
import 'package:psl_eight/models/match.dart';

import '../globals/app_globals.dart';
import '../models/team.dart';
import '../models/venue.dart';

class ProviderClass {
  static Future<List<TeamsModel>> getAllTeams(BuildContext context) async {
    var teams = <TeamsModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString(AppAssets.json);
    var jsonData = json.decode(data);

    var jsonTeams = jsonData[AppStrings.teams];

    for (var jsonTeam in jsonTeams) {
      TeamsModel team = TeamsModel.fromJSON(jsonTeam);
      teams.add(team);
    }

    return teams;
  }

  static Future<List<MatchModel>> getAllMatches(BuildContext context) async {
    var matches = <MatchModel>[];

    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString(AppAssets.json);
    var jsonData = json.decode(data);
    var jsonSchedule = jsonData[AppStrings.schedule];

    for (var jsonMatch in jsonSchedule) {
      MatchModel match = MatchModel.fromJSON(jsonMatch);
      matches.add(match);
    }

    return matches;
  }

  static Future<List<VenueModel>> getAllVenues(BuildContext context) async {
    var venues = <VenueModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString(AppAssets.json);
    var jsonData = json.decode(data);

    var jsonVenues = jsonData[AppStrings.venues];

    for (var jsonVenue in jsonVenues) {
      VenueModel venue = VenueModel.fromJSON(jsonVenue);
      venues.add(venue);
    }

    return venues;
  }

  static Future<List<HistoryModel>> getAllHistory(BuildContext context) async {
    var historyList = <HistoryModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString(AppAssets.json);
    var jsonData = json.decode(data);

    var jsonHistory = jsonData[AppStrings.history];

    for (var mapHistory in jsonHistory) {
      HistoryModel history = HistoryModel.fromJSON(mapHistory);
      historyList.add(history);
    }

    return historyList;
  }
}
