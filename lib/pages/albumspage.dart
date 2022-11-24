import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(69),
                bottomRight: Radius.circular(69),
              ),
            ),
            child: Image.asset(
              "assets/singer.png",
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            child: Text(
              "Billie eilish",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            " 2 album , 67 track",
            style: TextStyle(
              color: Color(0xff393939),
              fontSize: 13,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 8),
            child: SizedBox(
              width: 265,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 29,bottom: 17),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Albums",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 16,
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
             // color: Colors.amber,
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
                        Container(
                           //color: Colors.red,
                          height: 140,
                          child: Image.asset(
                            "assets/albumspageimage.png",
                            width: 140,
                          ),
                        ),
                        Container(
                        
                          alignment: Alignment.center,
                          //color: Colors.red,
                          width: 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "lilbubblegum",
                              style: TextStyle(
                                color: Color(0xff3a3a3a),
                                fontSize: 14,
                             
                                fontWeight: FontWeight.w700,
                              ),
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
        ],
      ),
    );
  }
}
