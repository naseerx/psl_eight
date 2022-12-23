import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_globals.dart';

import '../models/history.dart';
import '../provider/provider_class.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title: Text(AppStrings.history.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<HistoryModel>>(
            future: ProviderClass.getAllHistory(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<HistoryModel> historyList = snapshot.data;

                return ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      var history = historyList[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shadowColor: AppColors.purple,
                        elevation: 9,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              history.year + '  Hosted By  ' + history.host,
                              style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(history.winnerFlag,
                                    width: 130,
                                    height: 150,
                                    fit: BoxFit.fitWidth),
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    'VS',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Image.asset(history.runnerUpFlag,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.fitWidth),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  history.winner,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  history.runnerUp,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Winner',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Runner Up',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  history.winnerScore,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  history.runnerUpScore,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
