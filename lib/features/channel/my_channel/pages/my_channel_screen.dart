
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/bottons.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar_view.dart';
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
                      const Text("More about Crealify!"),
                      const TapBottons(),
                      // tab bar
                      const TapBarPage(),
                      const TapViewPages(),
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
