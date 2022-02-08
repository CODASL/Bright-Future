import 'package:brightfuture/Models/screen_size.dart';
import 'package:flutter/material.dart';

class AddImages extends StatelessWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.4,
      width: ScreenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 5,
            child: Container(
              child: const Center(
                child: Icon(Icons.add_a_photo),
              ),
              width: ScreenSize.width * 0.4,
              height: ScreenSize.height * 0.3,
              color: Colors.white,
            ),
          ),
          Material(
            elevation: 5,
            child: Container(
              child: const Center(
                child: Icon(Icons.add_a_photo),
              ),
              width: ScreenSize.width * 0.4,
              height: ScreenSize.height * 0.3,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
