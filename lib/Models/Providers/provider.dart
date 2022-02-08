import 'package:brightfuture/Models/Providers/check_connectivity.dart';
import 'package:brightfuture/Models/Providers/drawer_tile_change.dart';
import 'package:brightfuture/Models/Providers/login_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'bottom_nav.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<BottomNav>(
    create: (context) => BottomNav(),
  ),
  ChangeNotifierProvider<DrawerTileChange>(
    create: (context) => DrawerTileChange(),
  ),
  ChangeNotifierProvider<LoginState>(
    create: (context) => LoginState(),
  ),
  ChangeNotifierProvider<CheckConnectivity>(
    create: (context) => CheckConnectivity(),
  ),
];
