
import 'package:brightfuture/Providers/error_handler.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bottom_nav.dart';
import 'check_connectivity.dart';
import 'drawer_tile_change.dart';
import 'login_state.dart';

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
  ChangeNotifierProvider<ErrorHandler>(
    create: (context) => ErrorHandler(),
  ),
];
