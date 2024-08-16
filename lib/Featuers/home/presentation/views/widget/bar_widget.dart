import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class BarWidget extends StatefulWidget {
  const BarWidget({super.key});

  @override
  BarWidgetState createState() => BarWidgetState();
}

class BarWidgetState extends State<BarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of categories (tabs)
  final List<String> categories = [
    "Popular",
    "Politics",
    "Tech",
    "Healthy",
    "Science",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
      children: [
        // TabBar with custom styling
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label, // Size of the underline
          labelColor: AppColors.secondaryColor, // Selected tab text color
          unselectedLabelColor: Colors.grey, // Unselected tab text color
          labelStyle: AppStyles.styleMedium14, // Selected tab text style
          unselectedLabelStyle:
              AppStyles.styleMedium14, // Unselected tab text style
          indicatorColor:
              AppColors.secondaryColor, // Underline color for selected tab
          indicatorWeight: 1, // Thickness of the underline
          tabs: categories.map((category) => Tab(text: category)).toList(),
          onTap: (index) {
            // Handle tab selection
          },
          tabAlignment: TabAlignment.start,
        ),

        // TabBarView to show the content corresponding to each tab
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: categories.map((category) {
              return Center(
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 24),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
