import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  const SongItem({
    Key? key,
    this.title,
    this.artist,
  }) : super(key: key);
  final String? title, artist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        // color: Colors.red,
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: const Color(0xffE6E6E6),
                width: 50,
                child: Image.asset("assets/Play.png"),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        artist ?? "",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text("5:33"),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Image.asset("assets/heart.png"),
            )
          ],
        ),
      ),
    );
  }
}
