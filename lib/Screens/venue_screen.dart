import 'package:flutter/material.dart';
import 'package:psl_eight/globals/app_globals.dart';

import '../models/venue.dart';
import '../provider/provider_class.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title: Text(AppStrings.venues.toUpperCase()),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: 0.2,
              image: AssetImage(AppAssets.bachground),
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
                        var data = venues[index];
                        return Container(
                          height: 350,
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              color: AppColors.gGreenColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 5)
                              ]),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data.stadium,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                data.city,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Spacer(),
                              Container(
                                height: 280,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Image.asset(
                                      data.image,
                                      fit: BoxFit.cover,
                                    )),
                              ),
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
            )));
  }
}
