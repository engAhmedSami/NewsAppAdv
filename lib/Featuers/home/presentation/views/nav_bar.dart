import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/persistent_tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return const PersistentTab();
  }
}
