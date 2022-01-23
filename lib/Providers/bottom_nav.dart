import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisuupakara/Models/navigation_item.dart';
import 'package:sisuupakara/Screens/home_screen.dart';
import 'package:sisuupakara/Screens/profile_screen.dart';

class BottomNav extends ChangeNotifier {
  int currentIndex = 0;

  onChange(int val) {
    currentIndex = val;
    notifyListeners();
  }



  List<NavigationItem> navItems = [
    NavigationItem(label: "Home", icon: Icons.home, route: const HomeScreen()),
    NavigationItem(
        label: "Profile", icon: Icons.person, route: const ProfileScreen()),
  ];
}
