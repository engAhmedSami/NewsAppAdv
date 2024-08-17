import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/bar_widget.dart'; // Import BarWidget
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

  void onCountryChanged(String countryCode) {
    setState(() {
      selectedCountryCode = countryCode;
    });
  }

  void onCategoryChanged(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: HeaderCountryWidget(
                        onCountryChanged: onCountryChanged,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                BarWidget(onCategoryChanged: onCategoryChanged),
              ],
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
