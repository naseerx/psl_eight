import 'package:flutter/material.dart';

import '../globals/app_colors.dart';



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
          border: Border.all(color: AppColors.secondary , width: 3),
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
