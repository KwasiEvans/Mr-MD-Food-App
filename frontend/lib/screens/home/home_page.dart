import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/home/main_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MainPage(),
    // Container(child: Center(child: Text("Am next1"))),
    Container(child: Center(child: Text("Am next2"))),
    Container(child: Center(child: Text("Am next3"))),
    Container(child: Center(child: Text("Am next4"))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.transparent,
        color: AppColors.signColor,
        onTap: onTapNav,
        items: const [
          Icon(FontAwesomeIcons.home, color: AppColors.mainColor),
          Icon(FontAwesomeIcons.history, color: AppColors.iconColor1),
          Icon(FontAwesomeIcons.shoppingCart, color: AppColors.iconColor1),
          Icon(FontAwesomeIcons.personBooth, color: AppColors.iconColor1),
        ],
      ),
    );
  }
}
