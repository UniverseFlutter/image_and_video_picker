import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_and_video_picker/main.dart';
import 'package:image_and_video_picker/model/media_source.dart';
import 'package:image_and_video_picker/page/source_page.dart';
import 'package:image_and_video_picker/widget/video_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? fileMedia;
  late MediaSource source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: fileMedia == null
                    ? Icon(
                        Icons.photo,
                        size: 120,
                      )
                    : (source == MediaSource.image
                        ? Image.file(fileMedia!)
                        : VideoWidget(file: fileMedia!)),
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                onPressed: () => capture(MediaSource.image),
                child: Text('Вибрати зображення'),
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              RaisedButton(
                onPressed: () => capture(MediaSource.video),
                child: Text('Вибрати відеофайл'),
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(arguments: source),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
