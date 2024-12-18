import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/navigation_item.dart';


class BottomNavigationBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0.0, 0.1),
                blurRadius: 8.0,
                spreadRadius: 2.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavItem(
                    icon: CupertinoIcons.group_solid, label: 'المجتمع'),
                BottomNavItem(icon: Icons.tag_outlined, label: 'المنصة'),
                BottomNavItem(icon: Icons.class_outlined, label: 'الصفوف'),
                BottomNavItem(icon: Icons.tv, label: 'الاجتماعات'),
              ],
            ),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  '',
                ),
                Text(
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  'الرئيسية',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
