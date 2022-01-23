import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'bottom_nav.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<BottomNav>(
    create: (context) => BottomNav(),
  )
];
