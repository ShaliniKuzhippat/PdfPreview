import 'package:flutter/material.dart';

class ppt_view extends StatefulWidget {
  const ppt_view({super.key});

  @override
  State<ppt_view> createState() => _ppt_viewState();
}

class _ppt_viewState extends State<ppt_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Power point'),
    );
  }
}
