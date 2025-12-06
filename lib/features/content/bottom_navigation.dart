// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class BottomNavigation extends StatefulWidget {
//   final Function(int index) onPressed;
//   const BottomNavigation({super.key, required this.onPressed});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
//       child: GNav(
//         rippleColor: Colors.grey[100]!,
//         hoverColor: Colors.grey[100]!,
//         haptic: true,
//         tabBorderRadius: 15,
//         tabActiveBorder: Border.all(color: Colors.black, width: 1),
//         tabBorder: Border.all(color: Colors.grey, width: 1),
//         tabShadow: [BoxShadow(color: Colors.grey.withAlpha(1), blurRadius: 13)],
//         curve: Curves.easeInToLinear,
//         duration: const Duration(milliseconds: 300),
//         iconSize: 24,
//         gap: 2,
//         color: Colors.grey[800],
//         activeColor: Colors.purple,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         tabs: [
//           GButton(icon: Icons.home, text: 'Home'),
//           GButton(icon: Icons.videocam, text: 'Shorts'),
//           GButton(icon: Icons.cloud_upload),
//           GButton(icon: Icons.search, text: 'Search'),
//           GButton(icon: Icons.heart_broken, text: 'Log out'),
//         ],
//         onTabChange: widget.onPressed,
//         selectedIndex: currentIndex,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int index) onPressed;
  const BottomNavigation({super.key, required this.onPressed});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Colors.white, // optional background
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 equal spacing
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        haptic: true,

        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        tabShadow: [BoxShadow(color: Colors.white, blurRadius: 8)],
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        iconSize: 24,
        gap: 2,

        color: Colors.grey[800],
        activeColor: Colors.purple,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.videocam, text: 'Shorts'),
          GButton(icon: Icons.cloud_upload),
          GButton(icon: Icons.search, text: 'Search'),
          GButton(icon: Icons.heart_broken, text: 'Log out'),
        ],

        onTabChange: (index) {
          setState(() => currentIndex = index);
          widget.onPressed(index);
        },

        selectedIndex: currentIndex,
      ),
    );
  }
}
