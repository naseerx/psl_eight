import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_colors.dart';
import 'package:psl_eight/globals/app_strings.dart';
import 'package:psl_eight/providers/provider_class.dart';
import '../models/history.dart';
import '../widgets/background_widget.dart';
import '../widgets/history_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title:  Text(AppStrings.history.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
      body: BackgroundWidget(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<HistoryModel>>(
          future: ProviderClass.getAllHistory(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if( snapshot.hasData){

              List<HistoryModel> historyList = snapshot.data;

              return ListView.builder(
                  itemCount: historyList.length,
                  itemBuilder: (context, index){

                return HistoryWidget(history: historyList[index]);

              });

            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      )
    );
  }
}