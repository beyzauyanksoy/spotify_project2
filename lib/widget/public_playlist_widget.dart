import 'package:flutter/material.dart';

class ProfilePublicPlayList extends StatelessWidget {
  final String name;
  final String displayName;

  const ProfilePublicPlayList({
    Key? key,
    required this.name,
    required this.displayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              color: const Color(0xffE6E6E6),
              width: 50,
              child: Image.asset("assets/profilplaylistsmall.png")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          const Text("5:33"),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: const Icon(Icons.more_horiz),
          )
        ],
      ),
    );
  }
}
