// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotify_project_2/pages/album_page.dart';
import '../providers/spotify_provider.dart';
import '../widget/category_scroll_new.dart';
import '../widget/home_songwidget.dart';
import '../widget/song_item.dart';
import '../widget/type_seemore_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var spotifyProvider = Provider.of<SpotifyProvider>(context, listen: false);
    await spotifyProvider.getFeaturedPlaylists();
    spotifyProvider.getPlaylistWithId(
        spotifyProvider.featuredPlaylistModel?.playlists?.items?.first.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.search),
                            Image.asset("assets/spotifytitle.png"),
                            const Icon(Icons.more_vert_outlined),
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
                            top: 60,
                            left: 20,
                            child: Container(
                              width: 334,
                              height: 118,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xff42c73b),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                              bottom: 10,
                              child: Image.asset("assets/albumpicture.png"))
                        ],
                      ),
                    ],
                  ),
                  const HomenewsCategory(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      child: ListView.builder(
                        itemCount: provider.featuredPlaylistModel?.playlists
                                ?.items?.length ??
                            0,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              provider.getPlaylistWithId(
                                provider.featuredPlaylistModel?.playlists
                                    ?.items?[index].id,
                              );
                            },
                            child: HomeSongWidget(
                              image: provider.featuredPlaylistModel?.playlists
                                      ?.items?[index].images?.first.url ??
                                  "",
                              name: provider.featuredPlaylistModel?.playlists
                                      ?.items?[index].name ??
                                  "",
                              desc: provider.featuredPlaylistModel?.playlists
                                      ?.items?[index].description ??
                                  "",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 20,
                      bottom: 25,
                    ),
                    child: TypeSeeMoreWidget(
                      detailName: "See more",
                      listName: "PlayList",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount:
                            provider.playlistModel?.tracks?.items?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumsPage(
                                    id: provider
                                        .playlistModel
                                        ?.tracks
                                        ?.items?[index]
                                        .track
                                        ?.artists
                                        ?.first
                                        .id,
                                  ),
                                ),
                              );
                            },
                            child: SongItem(
                              title: provider.playlistModel?.tracks
                                      ?.items?[index].track?.name ??
                                  "",
                              artist: provider
                                      .playlistModel
                                      ?.tracks
                                      ?.items?[index]
                                      .track
                                      ?.artists
                                      ?.first
                                      .name ??
                                  "",
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
      },
    );
  }
}


