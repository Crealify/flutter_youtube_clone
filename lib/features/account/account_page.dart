import 'package:flutter/material.dart';
import 'package:youtube_clone/features/account/items.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(child: Column(children: [Items()])),
      ),
    );
  }
}
