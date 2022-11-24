import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ALbumPage extends StatefulWidget {
  const ALbumPage({super.key});

  @override
  State<ALbumPage> createState() => _ALbumPageState();
}

class _ALbumPageState extends State<ALbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
       leading: Icon(Icons.arrow_back_ios_new),
       actions: [
        Icon(Icons.more_vert_outlined)
       ],
     
      
      ),
    );
  }
}