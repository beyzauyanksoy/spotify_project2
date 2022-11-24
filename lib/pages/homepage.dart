import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Image.asset("assets/spotifytitle.png"),
                    Icon(Icons.more_vert_outlined),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 190,
                    // width: 300,
                    //color: Colors.red,
                  ),
                  Positioned(
                    top: 55,
                    left: 20,
                    child: Container(
                      width: 334,
                      height: 118,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff42c73b),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "New album",
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 10,
                                    //fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Happier Than\nEver",
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Billie Eilish",
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset("assets/albumbackgroundimage.png")
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 55,
                      bottom: 17,
                      child: Image.asset("assets/albumpicture.png"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  //color: Colors.amber,
                  child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "News",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color(0xffBEBEBE),
                                letterSpacing: .5,
                                fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  //color: Colors.amber,
                  child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  height: 190,
                                  child: Image.asset(
                                    "assets/playlistimage.png",
                                    width: 140,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Image.asset("assets/playicon.png"),
                                ),
                              ],
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 15, bottom: 3, top: 13),
                              child: Text(
                                "Bad Guy",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Billie Eilish",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left:25,right: 25,top: 20,bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "PlayList",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff131313),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("see more",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff131313),
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,right: 15
                ),
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
                              ClipOval(
                                child: Container(
                                  color: Color(0xffE6E6E6),
                                  width: 50,
                                  child: Image.asset("assets/Play.png"),
                                  ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("As It Was"),
                                  Text("Harry Styles"),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text("5:33"),
                              Image.asset("assets/heart.png")
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
      ),
    );
  }
}
