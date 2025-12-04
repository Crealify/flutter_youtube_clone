import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/custom_botton.dart';
import 'package:youtube_clone/features/search/widgets/search_channel_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
              SearchChannelTile(),
            ],
          ),
        ),
      ),
    );
  }
}
