import 'package:brightfuture/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTile extends StatelessWidget {
  final dynamic item;
  final dynamic tileData;
  final int index;
  const DrawerTile({Key? key, this.item, this.tileData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        selected: item.isTapped,
        selectedTileColor: primaryColor.withOpacity(0.3),
        onTap: () {
          tileData.onTileTapped(index: index, context: context);
        },
        leading:
            FaIcon(item.icon, color: item.isTapped ? primaryColor : kBlack),
        title: Text(
          item.title,
          style: TextStyle(
            color: item.isTapped ? primaryColor : kBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



//  color: item.isTapped ? primaryColor : kBlack,
//           text: item.title,
//           fontWeight: FontWeight.bold,