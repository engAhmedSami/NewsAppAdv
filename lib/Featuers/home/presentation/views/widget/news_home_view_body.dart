import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/news_list_view_biulder.dart';
import 'header_widget.dart';

class NewsHomeViewBody extends StatefulWidget {
  const NewsHomeViewBody({super.key});

  @override
  State<NewsHomeViewBody> createState() => _NewsHomeViewBodyState();
}

class _NewsHomeViewBodyState extends State<NewsHomeViewBody> {
  String selectedCountryCode = 'ae'; // Default to 'United Arab Emirates'

  void onCountryChanged(String countryCode) {
    setState(() {
      selectedCountryCode = countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: HeaderWidget(
            // selectedCountryCode: selectedCountryCode,
            onCountryChanged: onCountryChanged,
          ),
        ),
        const NewsListViewBuilder(category: '')
      ]),
    );
  }
}
