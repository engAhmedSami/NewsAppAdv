import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Featuers/home/presentation/views/news_home_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/setteing_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PersistentTab extends StatefulWidget {
  const PersistentTab({super.key});

  @override
  PersistentTabState createState() => PersistentTabState();
}

class PersistentTabState extends State<PersistentTab> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: AppColors.primaryColor,
      isVisible: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const NewsHomeView(),
      const Center(child: Text("Search")),
      const SetteingView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        activeColorPrimary: AppColors.secondaryColor,
        inactiveColorPrimary: Colors.blueGrey,
      ),
    ];
  }
}
