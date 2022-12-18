import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:psl_eight/globals/app_strings.dart';
import 'package:psl_eight/providers/provider_class.dart';

import '../globals/app_colors.dart';
import '../models/team.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (context, team, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          toolbarHeight: 80,
          title:  Text(AppStrings.teams.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: FutureBuilder<List<TeamsModel>>(
          future: ProviderClass.getAllTeams(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<TeamsModel> teams = snapshot.data;
              return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    var team = teams[index];
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
                                        team.flag,
                                        width: 120,
                                        height: 140,
                                      )),
                                  Column(
                                    children: [
                                      Text(
                                        team.fullName,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        team.captain,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        team.captainImage,
                                        width: 120,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                team.squad,
                                width: Get.width,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
