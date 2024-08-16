import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/bar_widget.dart';
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
      child: Column(
        children: [
          HeaderWidget(),
          SizedBox(height: 16),
          Expanded(
            child: BarWidget(),
          ),
        ],
      ),
    );
  }
}
