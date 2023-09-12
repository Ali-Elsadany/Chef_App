import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_assets.dart';
import 'custom_image.dart';

class CustomFileImage extends StatelessWidget{
  CustomFileImage({super.key, required this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
          radius: 75,
           backgroundImage: FileImage(File(image!.path),

    ),
        )
        :CustomImages(imgPath: AppAssets.avatar,);
    }

}