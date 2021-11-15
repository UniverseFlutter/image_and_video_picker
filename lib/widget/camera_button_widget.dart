import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_and_video_picker/model/media_source.dart';
import 'package:image_and_video_picker/widget/list_tile_widget.dart';
import 'package:image_picker/image_picker.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: 'З фотокамери',
        icon: Icons.camera_alt,
        onClicked: () => pickCameraMedia(context),
      );

  Future pickCameraMedia(BuildContext context) async {
    final MediaSource? source =
        ModalRoute.of(context)!.settings.arguments as MediaSource?;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;
    final media = await getMedia(source: ImageSource.camera);
    final file = File(media!.path);

    Navigator.of(context).pop(file);
  }
}
