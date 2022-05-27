import 'package:brightfuture/Providers/google_map_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../Models/post.dart';
import '../Services/Database/post_handeling.dart';
import 'add_post_controller.dart';
import 'bottom_nav.dart';
import 'check_connectivity.dart';
import 'drawer_tile_change.dart';
import 'error_handler.dart';
import 'home_screen_controller.dart';
import 'login_state.dart';
import 'my_post_controller.dart';
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
  ChangeNotifierProvider<MyPostController>(
    create: (context) => MyPostController(),
  ),
  ChangeNotifierProvider<ProfileScreenController>(
    create: (context) => ProfileScreenController(),
  ),
  ChangeNotifierProvider<AddPostController>(
    create: (context) => AddPostController(),
  ),
  ChangeNotifierProvider<HomeScreenController>(
    create: (context) => HomeScreenController(),
  ),
  StreamProvider<List<Post>>.value(
    value: PostHandling.listOfPosts(),
    initialData: const [],
  ),
  ChangeNotifierProvider<GoogleMapCtrl>(
    create: (context) => GoogleMapCtrl(),
  ),
];
