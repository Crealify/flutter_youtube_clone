import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
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
                        data: (currentUser) => CircleAvatar(
                          radius: 14,
                          backgroundImage: CachedNetworkImageProvider(
                            currentUser.profilePic,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        loading: () => const Loader(),
                        error: (error, stackTrace) => const ErrorPage(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
