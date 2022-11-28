import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestWidget extends StatelessWidget {
 
  final String title;

  const TestWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}