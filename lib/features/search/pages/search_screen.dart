import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/custom_botton.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/search/provider/search_provider.dart';
import 'package:youtube_clone/features/search/widgets/search_channel_tile.dart';
import 'package:youtube_clone/features/upload/long_video/parts/post.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

//Core Logic

class _SearchScreenState extends ConsumerState<SearchScreen> {
  List foundItems = [];

  //
  Future<void> filterList(String keywordSelected) async {
    List<UserModel> users = await ref.watch(allChannelsProvider);
    List<VideoModel> videos = await ref.watch(allVideosProvider.future);

    List result = [];

    // filter users
    final foundChannels = users
        .where(
          (user) => user.displayName.toLowerCase().contains(
            keywordSelected.toLowerCase(),
          ),
        )
        .toList();
    result.addAll(foundChannels);

    // filter videos
    final foundVideos = videos
        .where(
          (video) =>
              video.title.toLowerCase().contains(keywordSelected.toLowerCase()),
        )
        .toList();
    result.addAll(foundVideos);

    setState(() {
      result.shuffle();
      foundItems = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),

          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 4),
                  SizedBox(
                    height: 45,
                    width: 270,
                    child: TextFormField(
                      onChanged: (value) async {
                        await filterList(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      height: 45,
                      child: CustomButton(
                        iconData: Icons.search,
                        onTap: () {},
                        haveColor: true,
                      ),
                    ),
                  ),
                ],
              ),

              // SearchChannelTile(user: user),
              Expanded(
                child: ListView.builder(
                  itemCount: foundItems.length,
                  itemBuilder: (context, index) {
                    List<Widget> itemWidgets = [];
                    final selectedItem = foundItems[index];

                    if (selectedItem.type == "video") {
                      itemWidgets.add(Post(video: selectedItem));
                    }

                    if (selectedItem.type == "user") {
                      itemWidgets.add(SearchChannelTile(user: selectedItem));
                    }

                    if (foundItems.isEmpty) {
                      return const SizedBox();
                    }

                    return itemWidgets[0];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
