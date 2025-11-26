import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_filed_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(currentUserProvider)
        .when(
          data: (data) => Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 170,
                          width: double.infinity,

                          child: Image.asset(
                            "assets/images/flutter background.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        const Positioned(
                          left: 150,
                          top: 36,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 10,
                          child: Image.asset(
                            "assets/icons/camera.png",
                            height: 34,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // Seond Part
                    const SizedBox(height: 14),

                    SettingsItem(
                      identifier: "Name",
                      value: "Crealify",
                      onpressed: () {},
                    ),
                    const SizedBox(height: 1),
                    SettingsItem(
                      identifier: "Handle",
                      value: "@Crealify",
                      onpressed: () {},
                    ),
                    const SizedBox(height: 1),
                    SettingsItem(
                      identifier: "Description",
                      value: "",
                      onpressed: () {},
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Keep all my subscribers private"),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              isSwitched = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Text(
                        "Changes made on your names and profile pictures are visible only to  YouTube and not to your subscribers.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (error, stackTrack) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
