import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class HeaderCategoresWidget extends StatefulWidget {
  const HeaderCategoresWidget({super.key, required this.onCategoryChanged});

  final void Function(String category) onCategoryChanged;

  @override
  HeaderCategoresWidgetState createState() => HeaderCategoresWidgetState();
}

class HeaderCategoresWidgetState extends State<HeaderCategoresWidget> {
  String? selectedCategory = 'general';

  final Map<String, String> categories = {
    'General': 'general',
    'Business': 'business',
    'Entertainment': 'entertainment',
    'Health': 'health',
    'Science': 'science',
    'Sports': 'sports',
    'Technology': 'technology',
  };

  void onCategoryChanged(String? category) {
    if (category != null && categories.containsValue(category)) {
      setState(() {
        selectedCategory = category;
      });
      widget.onCategoryChanged(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.list,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedCategory,
            items: categories.keys.map((categoryName) {
              return DropdownMenuItem(
                value: categories[categoryName],
                child: Text(
                  categoryName,
                  style: AppStyles.styleMedium16,
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              );
            }).toList(),
            onChanged: onCategoryChanged,
          ),
        ),
      ],
    );
  }
}
