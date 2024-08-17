import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class BarWidget extends StatefulWidget {
  final void Function(String category) onCategoryChanged;

  const BarWidget({super.key, required this.onCategoryChanged});

  @override
  BarWidgetState createState() => BarWidgetState();
}

class BarWidgetState extends State<BarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of categories (tabs)
  final List<String> categories = [
    "general",
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    _tabController = TabController(length: categories.length, vsync: this);

    // Schedule the initial category change after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onCategoryChanged(categories[0]);
    });

    // Listen to tab changes and notify parent widget
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.onCategoryChanged(categories[_tabController.index]);
      }
    });
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
          labelStyle: AppStyles.styleMedium16, // Selected tab text style
          unselectedLabelStyle:
              AppStyles.styleMedium14, // Unselected tab text style
          indicatorColor:
              AppColors.secondaryColor, // Underline color for selected tab
          indicatorWeight: 1, // Thickness of the underline
          tabs: categories
              .map((category) => Tab(text: category.capitalize()))
              .toList(),
          tabAlignment: TabAlignment.start,
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
