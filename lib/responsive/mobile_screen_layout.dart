import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_socioapp/utils/colors.dart';
import 'package:project_socioapp/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'package:project_socioapp/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Color.fromRGBO(12, 12, 12, 20),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
              color:
                  _page == 0 ? Color.fromRGBO(30, 215, 96, 20) : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
              size: 25,
              color:
                  _page == 1 ? Color.fromRGBO(30, 215, 96, 20) : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: 25,
              color:
                  _page == 2 ? Color.fromRGBO(30, 215, 96, 20) : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 25,
              color:
                  _page == 3 ? Color.fromRGBO(30, 215, 96, 20) : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
              color:
                  _page == 4 ? Color.fromRGBO(30, 215, 96, 20) : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
