import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/profile_model.dart';
import '../providers/spotify_provider.dart';
import '../widget/public_playlist_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var provider = Provider.of<SpotifyProvider>(context, listen: false);
    provider.getProfile();
    provider.getuserplaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
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
                        SlideInLeft(
                            child: Image.asset("assets/profileimage.png")),
                        SlideInRight(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 8),
                            child: Text(
                              provider.userprofil?.email.toString() ?? "",
                              style: const TextStyle(
                                color: Color(0xff222222),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SlideInLeft(
                          child: Text(
                            provider.userprofil?.displayName.toString() ?? "",
                            style: const TextStyle(
                              color: Color(0xff222222),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SlideInRight(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      provider.userprofil?.followers?.total
                                              .toString() ??
                                          "0",
                                      style: const TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Text(
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
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.amber,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: provider.userplaylist?.items?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: ProfilePublicPlayList(
                              displayName:
                                  "${provider.userplaylist?.items?[index].owner?.displayName?.toUpperCase()}",
                              name: provider.userplaylist?.items?[index].name
                                      .toString() ??
                                  "",
                              imageUrl: provider.userplaylist!.items![index]
                                      .images!.isNotEmpty
                                  ? provider.userplaylist!.items![index].images!
                                      .first.url
                                  : null,
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
      },
    );
  }
}
