
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final String _url_pdf =
      'https://uconn.edu/content/uploads/sites/11/2023/02/STAM_002_UConn-Stamford-Map-update-FY2023.pdf';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfPdfViewer.network(_url_pdf),
    );
  }
}
