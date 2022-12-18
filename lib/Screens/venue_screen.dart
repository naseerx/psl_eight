import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_colors.dart';
import 'package:psl_eight/globals/app_strings.dart';

import '../models/venue.dart';
import '../providers/provider_class.dart';
import '../widgets/venue_widget.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title:  Text(AppStrings.venues.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: 0.2,
              image: AssetImage('assets/bj.jpg'),
              fit: BoxFit.fill,
            )),
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<VenueModel>>(
              future: ProviderClass.getAllVenues(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<VenueModel> venues = snapshot.data;

                  return ListView.builder(
                      itemCount: venues.length,
                      itemBuilder: (context, index) {
                        return VenueWidget(venue: venues[index]);
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
