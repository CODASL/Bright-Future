import 'package:brightfuture/Models/Providers/drawer_tile_change.dart';
import 'package:brightfuture/Models/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScreenSize.setScreenSize(h: screenSize.height, w: screenSize.width);
    Provider.of<DrawerTileChange>(context, listen: true)
        .drawerTileData[0]
        .isTapped = true;

    return const Login();
  }
}
