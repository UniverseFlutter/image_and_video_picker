import 'package:flutter/material.dart';
import 'package:image_and_video_picker/widget/camera_button_widget.dart';
import 'package:image_and_video_picker/widget/gallery_button_widget.dart';

class SourcePage extends StatelessWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Джерело контенту'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CameraButtonWidget(),
          GalleryButtonWidget(),
        ],
      ),
    );
  }
}
