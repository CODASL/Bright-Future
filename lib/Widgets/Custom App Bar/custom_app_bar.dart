import 'package:brightfuture/Screens/login.dart';
import 'package:flutter/material.dart';



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

