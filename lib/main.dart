import 'dart:io';

import 'package:firebase_1/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String _url_ppt = 'https://www.africau.edu/images/default/sample.pdf';

  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pich Deck'),
          centerTitle: true,
        ),
        body: Center(
          child: start_page(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print("button pressed");
            FileDownloader.downloadFile(
                url: _url_ppt,
                onDownloadError: (String error) {
                  print('Error while downloading: $error');
                },
                onDownloadCompleted: (path) {
                  final File file = File(path);
                  print(file);
                });
          },
          label: Text('Download'),
          icon: Icon(Icons.edit),
        ),
      ),
    );
  }
}
