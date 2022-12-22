import 'package:flutter/material.dart';

import '../globals/app_colors.dart';
import '../models/match.dart';

class MatchWidget extends StatelessWidget {
  final MatchModel match;

  const MatchWidget({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration:  BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RoundFlag(flag: match.flagOne),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            match.teamOne,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                          width: 35,
                          height: 20,
                          child: Center(
                              child: Text(
                            'VS',
                            style: TextStyle(color: Colors.white),
                          ))),
                      Row(
                        children: [
                          RoundFlag(flag: match.flagTwo),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            match.teamTwo,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                      color: AppColors.gGreenColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        match.venue,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 15,
            child: Image.asset(
              'assets/vs.png',
              width: 70,
              height: 70,
            ),
          )
        ],
      ),
    );
  }
}

class RoundFlag extends StatelessWidget {
  final String flag;

  const RoundFlag({Key? key, required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2)),
      child: ClipOval(
        child: Image.asset(
          'assets/flags/$flag',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
