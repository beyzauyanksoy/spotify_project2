import 'package:flutter/material.dart';

class HomeSongWidget extends StatelessWidget {
  final String image;

  final String name;
  final String desc;

  const HomeSongWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                child: Image.network(
                  image,
                  width: 160,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Image.asset("assets/playicon.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 3, top: 13),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
