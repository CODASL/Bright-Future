import 'package:brightfuture/Models/Providers/bottom_nav.dart';
import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
import 'package:brightfuture/Widgets/CustomDrawer/drawer.dart';
import 'package:brightfuture/Widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNav>(
      builder: (context, bnav, child) {
        return Scaffold(
          drawer: const CustomDrawer(),
          floatingActionButton: CustomFloatingActionButton(
            bNav: bnav,
          ),
          appBar: customAppBar(
              title: bnav.navItems[bnav.currentIndex].label, context: context),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bnav.currentIndex,
            items: bnav.navItems.map((e) {
              return BottomNavigationBarItem(
                  icon: Icon(e.icon), label: e.label);
            }).toList(),
            onTap: (val) {
              bnav.onChange(val);
            },
          ),
          body: bnav.navItems[bnav.currentIndex].route,
        );
      },
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final dynamic bNav;
  const CustomFloatingActionButton({Key? key, this.bNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bNav.currentIndex == 1
        ? FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.phone),
          )
        : FloatingActionButton.extended(
            label: const CustomText(title: "Add a Post"),
            onPressed: () {},
            icon: const Icon(Icons.post_add),
          );
  }
}
