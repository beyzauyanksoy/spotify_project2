import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<Color> renk = [
  Color(0xffff8a44),
  Color(0xffa78398),
  Color(0xff8796b7),
  Color(0xff69836b),
  Color(0xffff8a44),
  Color(0xffa78398),
  Color(0xff8796b7),
  Color(0xff69836b),
  Color(0xffff8a44),
  Color(0xffa78398),
  Color(0xff8796b7),
  Color(0xff69836b),
  Color(0xffff8a44),
  Color(0xffa78398),
  Color(0xff8796b7),
  Color(0xff69836b),
  Color(0xffff8a44),
  Color(0xffa78398),
  Color(0xff8796b7),
  Color(0xff69836b),
];

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    spotifyProvider.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child:  provider.response?.categories!=null?   Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
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
                      itemCount: provider.response?.categories?.items?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.5, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //color: Color(Random().nextInt(0xfff2a98a))
                                color: Colors.green.shade300),
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${provider.response?.categories?.items?[index].name}",
                                    style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 80, top: 7),
                                    child: ClipOval(
                                      child: Image.network(
                                        "${provider.response?.categories?.items?[index].icons?.first.url}",
                                        width: 65,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*    child: Text(provider
                                    .response!.categories!.items![index].name
                                    .toString()), */
                          ),
                        );
                      }),
                ),
              ],
            ):  CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
