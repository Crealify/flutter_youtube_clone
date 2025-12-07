import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'package:youtube_clone/features/account/account_page.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/content/bottom_navigation.dart';
import 'package:youtube_clone/features/upload/upload_bottom_sheets.dart';
import 'package:youtube_clone/pages_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Row(
                children: [
                  Image.asset("assets/images/youtube.jpg", height: 36),
                  const SizedBox(width: 4),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      height: 42,
                      child: ImageButton(
                        onPressed: () {},
                        haveColor: false,
                        image: 'cast.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ImageButton(
                      image: 'notification.png',
                      // image: Image.asset("assets/icons/notification.png"),
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 15),
                    child: SizedBox(
                      height: 38,
                      child: ImageButton(
                        image: 'search.png',

                        onPressed: () {},
                        haveColor: false,
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final userAsyncValue = ref.watch(currentUserProvider);
                      return userAsyncValue.when(
                        data: (currentUser) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AccountPage(user: currentUser),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                        loading: () => const Loader(),
                        error: (error, stackTrace) => const ErrorPage(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: pages[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        onPressed: (index) {
          if (index != 2) {
            currentIndex = index;
            setState(() {});
          } else {
            showModalBottomSheet(
              context: context,
              builder: (context) => CreateBottomSheet(),
            );
          }
        },
      ),
    );
  }
}
