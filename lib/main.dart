import 'dart:io';

import 'package:firebase_1/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA6iI-DWru6OylA58srsbJoTd4dCTphWOQ",
          appId: "1:435700051337:android:2e6566fc000e74f93d8558",
          messagingSenderId: "435700051337",
          projectId: "flutter-firebase-app-95c01"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String _url_ppt =
      'https://brand.uconn.edu/wp-content/uploads/sites/2820/2019/08/white-oakleaf-standard-temp.pptx';

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
          icon: Icon(Icons.arrow_downward_rounded),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
