import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Providers/add_image_controller.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddImages extends StatelessWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddImageController>(
      builder: (context, ctrl, child) {
        return SizedBox(
          height: ScreenSize.height * 0.4,
          width: ScreenSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  try {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    ctrl.addImage("Image1", image);
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: InkWell(
                  onTap: () async {
                    try {
                      final ImagePicker _picker = ImagePicker();
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);

                      ctrl.addImage("Image1", image);
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: Material(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: ctrl.images['Image1'] != null
                            ? DecorationImage(
                                image:
                                    XFileImage(ctrl.images['Image1'] as XFile))
                            : null,
                      ),
                      child: ctrl.images['Image1'] == null
                          ? const Center(
                              child: Icon(Icons.add_a_photo),
                            )
                          : null,
                      width: ScreenSize.width * 0.4,
                      height: ScreenSize.height * 0.3,
                    ),
                  ),
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
      },
    );
  }
}
