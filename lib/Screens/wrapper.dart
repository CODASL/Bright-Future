import 'package:brightfuture/Models/Providers/check_connectivity.dart';
import 'package:brightfuture/Models/Providers/drawer_tile_change.dart';
import 'package:brightfuture/Models/Providers/login_state.dart';
import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Screens/home.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/CustomText/custom_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connection = Provider.of<CheckConnectivity>(context, listen: true);
    bool _isLoggedIn = Provider.of<LoginState>(context).isLoggedIn;
    final Size screenSize = MediaQuery.of(context).size;
    ScreenSize.setScreenSize(h: screenSize.height, w: screenSize.width);
    Provider.of<DrawerTileChange>(context, listen: true)
        .drawerTileData[0]
        .isTapped = true;

    Provider.of<LoginState>(context).checkLoginState();

    if (connection.isConnectionSuccessful ||
        connection.connectivityResult != ConnectivityResult.none) {
      return _isLoggedIn ? const Home() : const Login();
    }
    return ErrorPage(isLoggedIn: _isLoggedIn);
  }
}




class ErrorPage extends StatelessWidget {
  final bool isLoggedIn;
  const ErrorPage({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connection = Provider.of<CheckConnectivity>(context, listen: true);
    return Scaffold(
        body: SizedBox(
      width: ScreenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomText(
            title: "No Internet Connection",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            label: "Try Again",
            height: 50,
            minWidth: ScreenSize.width * 0.5,
            radius: 20,
            onPressed: () {
              connection.tryConnection();
              if (connection.isConnectionSuccessful ||
                  connection.connectivityResult != ConnectivityResult.none) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return isLoggedIn ? const Home() : const Login();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
