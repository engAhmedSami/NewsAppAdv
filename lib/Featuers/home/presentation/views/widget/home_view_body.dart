import 'package:flutter/material.dart';
import 'header_widget.dart';

class NewsHomeViewBody extends StatefulWidget {
  const NewsHomeViewBody({super.key});

  @override
  State<NewsHomeViewBody> createState() => _NewsHomeViewBodyState();
}

class _NewsHomeViewBodyState extends State<NewsHomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HeaderWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
