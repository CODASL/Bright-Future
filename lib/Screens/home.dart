import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisuupakara/Providers/bottom_nav.dart';
import 'package:sisuupakara/Screens/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNav>(
      builder: (context, bnav, child) {
        return Scaffold(
          drawer: const Drawer(),
          floatingActionButton: bnav.currentIndex == 1
              ? FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.phone),
                )
              : const SizedBox(),
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

PreferredSize customAppBar({
  required String title,
  required BuildContext context,
}) {
  return PreferredSize(
      child: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return const Login();
              }));
            },
            child: Row(
              children: const [
                Text("Logout"),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.logout),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          )
        ],
      ),
      preferredSize: const Size.fromHeight(66));
}
