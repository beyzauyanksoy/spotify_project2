import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider/provider.dart';

import '../providers/spotify_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpotifyProvider searchProvider =
        Provider.of<SpotifyProvider>(context, listen: false);
    searchProvider.getSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        provider.getQuery(query: 'Yasin');
                      } else {
                        provider.getQuery(query: value);
                      }
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Ne dinlemek istiyorsun?",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.searchmodel?.tracks?.items?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              ),
                          height: 70,
                          child: Row(
                            children: [
                              provider.searchmodel?.tracks?.items?[index].album
                                          ?.images?[0].url !=
                                      null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        child: Image.network(
                                            "${provider.searchmodel?.tracks?.items?[index].album?.images?[0].url}"),
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                   child: provider.searchmodel?.tracks
                                            ?.items?[index].name !=
                                        null
                                    ? Text(
                                        '${provider.searchmodel?.tracks?.items?[index].name}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : const SizedBox(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
