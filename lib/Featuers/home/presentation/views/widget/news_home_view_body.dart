import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/header_categores_widget.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/news_list_view_biulder.dart';
import 'header_country_widget.dart';

class NewsHomeViewBody extends StatefulWidget {
  const NewsHomeViewBody({super.key});

  @override
  State<NewsHomeViewBody> createState() => _NewsHomeViewBodyState();
}

class _NewsHomeViewBodyState extends State<NewsHomeViewBody> {
  String selectedCountryCode = 'eg'; // Default to 'Egypt'
  String selectedCategory = 'general'; // Default to 'General News'

  void onCategoryChanged(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void onCountryChanged(String countryCode) {
    setState(() {
      selectedCountryCode = countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: HeaderCountryWidget(
                      onCountryChanged: onCountryChanged,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HeaderCategoresWidget(
                      onCategoryChanged: onCategoryChanged,
                    ),
                  ),
                ],
              ),
            ),
          ),
          NewsListViewBuilder(
            category: selectedCategory,
            selectedCountryCode: selectedCountryCode,
          ),
        ],
      ),
    );
  }
}
