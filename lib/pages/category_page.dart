import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotify_project_2/pages/search_page.dart';

import '../providers/spotify_provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    var spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    spotifyProvider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: provider.categories?.categories != null
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Ara",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: TextFormField(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage()),
                                );
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Ne dinlemek istiyorsun?",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Hepsine göz at",
                          style: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          //  shrinkWrap: true,
                          itemCount:
                              provider.categories?.categories?.items?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      "${provider.categories?.categories?.items?[index].icons?.first.url}",
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      bottom: 4,
                                      right: 0,
                                      left: 0,
                                      child: Text(
                                        "${provider.categories?.categories?.items?[index].name ?? ""}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
