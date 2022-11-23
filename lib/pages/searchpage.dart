import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';
import '../services/spotify_services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<Color> renk = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.grey,
  Colors.amber,
  Colors.pink,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.grey,
  Colors.amber,
  Colors.pink,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.grey,
  Colors.amber,
  Colors.pink,
  Colors.red,
  Colors.blue,
];

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Ara",
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Ne dinlemek istiyorsunuz?',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Hepsine göz at",
                    style: GoogleFonts.lato(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    //  shrinkWrap: true,
                    itemCount: renk.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              //color: Color(Random().nextInt(0xfff2a98a))
                              color: renk[index]),
                          child: Text(
                              "${provider.response?.categories?.href.toString()}"),
                          width: 100,
                          /*    child: Text(provider
                                    .response!.categories!.items![index].name
                                    .toString()), */
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
