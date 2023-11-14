import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final String _url_pdf =
      'https://uconn.edu/content/uploads/sites/11/2023/02/STAM_002_UConn-Stamford-Map-update-FY2023.pdf';
  final String _url_img =
      'https://brand.uconn.edu/wp-content/uploads/sites/2820/2019/08/uconn-2fold-brochure.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_url_img),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
            title: const Text('Preview Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: ElevatedButton(
                  child: const Text('Download'),
                  onPressed: () {
                    print("button pressed");
                    FileDownloader.downloadFile(
                        url: _url_pdf,
                        onDownloadError: (String error) {
                          print('Error while downloading: $error');
                        },
                        onDownloadCompleted: (path) {
                          final File file = File(path);
                          print(file);
                        });
                  },
                )),
              ],
            ),
          )),
    );
  }
}
