import 'package:flutter/material.dart';

class TypeSeeMoreWidget extends StatelessWidget {
  final String listName;
  final String detailName;
  const TypeSeeMoreWidget({
    Key? key,
    required this.listName,
    required this.detailName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          listName,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff131313),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          detailName,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff131313),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
