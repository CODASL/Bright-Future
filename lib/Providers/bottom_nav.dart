import 'package:brightfuture/Models/navigation_item.dart';
import 'package:brightfuture/Screens/home_screen.dart';
import 'package:brightfuture/Screens/profile_screen.dart';

import 'package:flutter/material.dart';


class BottomNav extends ChangeNotifier {
  int currentIndex = 0;

  onChange(int val) {
    currentIndex = val;
    notifyListeners();
  }

  List<NavigationItem> navItems = [
    NavigationItem(label: "Posts", icon: Icons.explore,route: const HomeScreen()),
    NavigationItem(
      label: "Profile",
      icon: Icons.person,
      route: const ProfileScreen(),
    ),
  ];
}
