import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/repository/edit_fields.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/edit_setting_dialog.dart';
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
          data: (currentUser) => Scaffold(
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

                        Positioned(
                          left: 150,
                          top: 36,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic,
                              ),
                            ),
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
                      value: currentUser.displayName,
                      onpressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            identifier: "Your New Name",
                            onSave: (name) {
                              ref
                                  .watch(editSettindsProvider)
                                  .editDisplayName(name);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 1),
                    SettingsItem(
                      identifier: "Username",
                      value: currentUser.username,
                      onpressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            identifier: "Your New Username",
                            onSave: (username) {
                              ref
                                  .watch(editSettindsProvider)
                                  .editUsername(username);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 1),
                    SettingsItem(
                      identifier: "Description",
                      value: currentUser.description,
                      onpressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            identifier: "Your New Description",
                            onSave: (description) {
                              ref
                                  .watch(editSettindsProvider)
                                  .editDescriptoion(description);
                            },
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
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
                        horizontal: 20,
                        vertical: 10,
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
