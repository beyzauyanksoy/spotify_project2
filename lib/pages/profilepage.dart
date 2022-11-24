import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 326,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(69),
                  bottomRight: Radius.circular(69),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Image.asset("assets/profileimage.png"),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 8),
                      child: Text(
                        'Soroushnorozyui@gmail.com',
                        style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text(
                      "Soroushnrz",
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                '778',
                                style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Followes",
                                style: TextStyle(
                                  color: Color(0xff585858),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                '778',
                                style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Followes",
                                style: TextStyle(
                                  color: Color(0xff585858),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Container(
              padding: const EdgeInsets.only(left: 29, bottom: 17),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Public playlists",
                style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 16,
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                //color: Colors.amber,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        //color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Color(0xffE6E6E6),
                              width: 50,
                              child:
                                  Image.asset("assets/profilplaylistsmall.png"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "dont smile at me",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text("Billie Eilish"),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text("5:33"),
                            Icon(Icons.more_horiz)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
