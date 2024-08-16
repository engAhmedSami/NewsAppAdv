import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  HeaderWidgetState createState() => HeaderWidgetState();
}

class HeaderWidgetState extends State<HeaderWidget> {
  String? selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        DropdownButton<String>(
          value: selectedLanguage ?? 'ar', // Default to 'ar' if null
          items: const [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                'en',
                style: AppStyles.styleMedium16,
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                'ar',
                style: AppStyles.styleMedium16,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedLanguage = value;
            });
          },
        ),
        const Spacer(),
        IconButton(
          color: AppColors.secondaryColor,
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
