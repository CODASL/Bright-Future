
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bottom_nav.dart';
import 'check_connectivity.dart';
import 'drawer_tile_change.dart';
import 'error_handler.dart';
import 'login_state.dart';
import 'post_controller.dart';
import 'profile_screen_controller.dart';

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
  ChangeNotifierProvider<PostController>(
    create: (context) => PostController(),
  ),
  ChangeNotifierProvider<ProfileScreenController>(
    create: (context) => ProfileScreenController(),
  ),
];
