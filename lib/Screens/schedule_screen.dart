import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_colors.dart';
import 'package:psl_eight/globals/app_strings.dart';

import '../models/match.dart';
import '../providers/provider_class.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title: Text(AppStrings.schedule.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: 0.4,
              image: AssetImage('assets/bj.jpg'),
              fit: BoxFit.fill,
            )),
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<MatchModel>>(
              future: ProviderClass.getAllMatches(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<MatchModel> matches = snapshot.data;

                  return ListView.builder(
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        var match = matches[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(colors: [
                                  AppColors.gGreenColor,
                                  AppColors.orange800
                                ])),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            match.flagOne,
                                            width: 120,
                                            height: 140,
                                          )),
                                      Column(
                                        children: [
                                          Text(
                                            match.teamOne,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            match.teamTwo,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            match.flagTwo,
                                            width: 120,
                                            height: 160,
                                            fit: BoxFit.cover,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}
