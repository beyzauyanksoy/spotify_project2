import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_project_2/providers/spotify_provider.dart';
import 'package:spotify_project_2/widget/song_item.dart';

import '../services/spotify_services.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key, required this.id});
  final String? id;
  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var provider = Provider.of<SpotifyProvider>(context, listen: false);
    //Albums
    await provider.getAlbum(
      widget.id,
    );
    //Songs
    provider.artistSongs = await Services().getAlbumTracks(
      provider.albumModel?.items?.first.id,
    );
    //Artist Image, name, genres
    provider.getArtist(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: const [Icon(Icons.more_vert)],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                provider.artistModel?.images?.first.url == null
                    ? const SizedBox()
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(69),
                          bottomRight: Radius.circular(69),
                        ),
                        child: Image.network(
                          provider.artistModel?.images?.first.url ?? "",
                          height: MediaQuery.of(context).size.width / 1.3,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 6),
                  child: Text(
                    provider.artistModel?.name ?? "",
                    style: const TextStyle(
                      color: Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  " ${provider.albumModel?.total} album",
                  style: const TextStyle(
                    color: Color(0xff393939),
                    fontSize: 13,
                  ),
                ),
                provider.artistModel?.genres == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 8),
                        child: SizedBox(
                          width: 265,
                          child: Text(
                            provider.artistModel?.genres
                                    .toString()
                                    .replaceAll("[", "")
                                    .replaceAll("]", "") ??
                                "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.only(left: 29, bottom: 17),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      itemCount: provider.albumModel?.items?.length ?? 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.getAlbumTracks(
                              provider.albumModel?.items?[index].id,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 140,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      provider.albumModel?.items?[index]
                                              .images?[1].url ??
                                          "",
                                      width: 140,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      provider.albumModel?.items?[index].name ??
                                          "",
                                      style: const TextStyle(
                                        color: Color(0xff3a3a3a),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Songs",
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
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: provider.artistSongs?.items?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SongItem(
                          title: provider.artistSongs?.items?[index].name ?? "",
                          artist: provider.artistSongs?.items?[index].artists
                                  ?.map(
                                    (e) {
                                      return e.name;
                                    },
                                  )
                                  .toList()
                                  .toString()
                                  .replaceAll("]", "")
                                  .replaceAll("[", "") ??
                              "",
                        );
                      },
                    ),
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
