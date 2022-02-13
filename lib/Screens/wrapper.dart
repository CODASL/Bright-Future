
import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Screens/home.dart';
import 'package:brightfuture/Widgets/Error%20Page/error_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/check_connectivity.dart';
import '../Providers/drawer_tile_change.dart';
import '../Providers/login_state.dart';
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
