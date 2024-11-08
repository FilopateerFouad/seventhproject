import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:seventhproject/fixturesscreen.dart';
import 'package:seventhproject/standingsscreen.dart';
import 'package:seventhproject/widgets/custom_text.dart';

class Footballscreen extends StatefulWidget {
  const Footballscreen({super.key});

  @override
  State<Footballscreen> createState() => FootballscreenState();
}

class FootballscreenState extends State<Footballscreen> {
  int currentPage = 0;

    final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [FixturesPage(), Standingsscreen()],
       onPageChanged: (index) {
          setState(() => currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: const Color(0xFF438FCE),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: currentPage,
        onTap: (int index) {
          pageController.jumpToPage(index);
          setState(() => currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(
              Icons.calendar_month,
              color: Color(0xFFFFFFFF),
            ),
            activeIconColor: const Color(0xFFFFFFFF),
            title: CustomText(
                text: "Fixtures",
                isBold: true,
                colours: 0xFFFFFFFF,
                fontSize: 20,
                align: TextAlign.center),
            activeColor: const Color(0xFFFFFFFF),
            activeTitleColor: const Color(0xFFFFFFFF),
          ),
          BottomBarItem(
              activeIconColor: const Color(0xFFFFFFFF),
              icon: const Icon(Icons.table_rows, color: Color(0xFFFFFFFF)),
              title: CustomText(
                  text: "Standings",
                  isBold: true,
                  colours: 0xFFFFFFFF,
                  fontSize: 20,
                  align: TextAlign.center),
              activeColor: const Color(0xFFFFFFFF),
              activeTitleColor: const Color(0xFFFFFFFF)),
        ],
      ),
    );
  }
}
