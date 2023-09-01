import 'package:flutter/material.dart';
import 'package:trip_app/navigation_pages/favourite_page.dart';
import 'package:trip_app/navigation_pages/mail_page.dart';
import 'package:trip_app/navigation_pages/profile_page.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../main_pages/home_page/home_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late final PageController pageController;
  int currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    Favourite(),
    Mail(),
    Profile(),
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: pages,
        ),
        bottomNavigationBar: WaterDropNavBar(
          bottomPadding: 10.0,
          waterDropColor: Colors.green,
          backgroundColor: Colors.white,
          onItemSelected: onTap,
          selectedIndex: currentIndex,
          barItems: [
            BarItem(
              filledIcon: Icons.home_filled,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded,
            ),
            BarItem(
              filledIcon: Icons.mail,
              outlinedIcon: Icons.mail_outline_outlined,
            ),
            BarItem(
              filledIcon: Icons.people,
              outlinedIcon: Icons.people_outline,
            ),
          ],
        ),
      ),
    );
  }
}
