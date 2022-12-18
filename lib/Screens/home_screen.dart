import 'package:flutter/material.dart';
import 'package:psl_eight/Screens/schedule_screen.dart';
import 'package:psl_eight/Screens/team_screen.dart';
import 'package:psl_eight/Screens/venue_screen.dart';
import 'package:psl_eight/globals/app_colors.dart';
import 'package:psl_eight/globals/app_strings.dart';

import '../widgets/dashboard_item.dart';
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
      body: SingleChildScrollView(
        child:
            // Container(
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //     opacity: 0.1,
            //     image: AssetImage(AppAssets.bachground),
            //     fit: BoxFit.fill,
            //   )),
            //   padding: const EdgeInsets.all(20),
            //   child:
            Column(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
    );
  }
}
