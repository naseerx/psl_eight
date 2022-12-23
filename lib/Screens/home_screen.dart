import 'package:flutter/material.dart';
import 'package:psl_eight/Screens/schedule_screen.dart';
import 'package:psl_eight/Screens/team_screen.dart';
import 'package:psl_eight/Screens/venue_screen.dart';
import 'package:psl_eight/globals/app_globals.dart';

import 'history_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          title: const Text(AppStrings.homeTitle),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.primaryColor,
          child: Column(
            children: const [
              DrawerHeader(child: Text(AppStrings.appTitle)),
              ListTile(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(AppAssets.bachground),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeItem(
                      icon: Icons.schedule,
                      title: AppStrings.schedule,
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const ScheduleScreen();
                        }));
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    HomeItem(
                      icon: Icons.add,
                      title: AppStrings.venues,
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const VenueScreen();
                        }));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeItem(
                      icon: Icons.history,
                      title: AppStrings.history,
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const HistoryScreen();
                        }));
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    HomeItem(
                      icon: Icons.group,
                      title: AppStrings.teams,
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const TeamScreen();
                        }));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeItem(
                      icon: Icons.info_outline_rounded,
                      title: AppStrings.liveScore,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    HomeItem(
                      icon: Icons.videocam_outlined,
                      title: AppStrings.highlights,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

class HomeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const HomeItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.23,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary, width: 3),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(30),
              topLeft: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 90,
              color: AppColors.secondary,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
