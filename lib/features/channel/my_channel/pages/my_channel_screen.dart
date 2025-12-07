import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/bottons.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar_page.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar_view_page.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/top_header.dart';

class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(currentUserProvider)
        .when(
          data: (currentUser) => DefaultTabController(
            length: 7,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      // top header
                      TopHeader(user: currentUser),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Center(
                          child: const Text("More about Crealify!"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: const TapBottons(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: const TapBarPage(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: SizedBox(
                          height: 400,
                          child: const TapBarViewPages(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
