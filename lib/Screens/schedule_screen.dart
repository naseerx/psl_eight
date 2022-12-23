import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_assets.dart';
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
          elevation: 5,
          shadowColor: Colors.teal,
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
              opacity: 0.1,
              image: AssetImage(AppAssets.bachground),
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
                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          shadowColor: Colors.teal,
                          elevation: 9,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Text(match.number),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            match.flagOne,
                                            width: 110,
                                            height: 110,
                                            fit: BoxFit.cover,
                                          )),
                                      const Text(
                                        'VS',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            match.flagTwo,
                                            width: 110,
                                            height: 110,
                                            fit: BoxFit.cover,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        match.teamOne,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        match.teamTwo,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Text(match.date),
                                  const SizedBox(height: 10,),
                                  Text(match.venue),
                                ],
                              ),
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
