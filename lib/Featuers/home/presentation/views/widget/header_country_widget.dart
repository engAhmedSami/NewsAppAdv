import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class HeaderCountryWidget extends StatefulWidget {
  const HeaderCountryWidget({super.key, required this.onCountryChanged});

  final void Function(String countryCode) onCountryChanged;

  @override
  HeaderCountryWidgetState createState() => HeaderCountryWidgetState();
}

class HeaderCountryWidgetState extends State<HeaderCountryWidget> {
  String? selectedCountry = 'Egypt';

  final Map<String, String> countryCodes = {
    'Argentina': 'ar',
    'Australia': 'au',
    'Austria': 'at',
    'Belgium': 'be',
    'Brazil': 'br',
    'Bulgaria': 'bg',
    'Canada': 'ca',
    'China': 'cn',
    'Colombia': 'co',
    'Czech Republic': 'cz',
    'Egypt': 'eg',
    'France': 'fr',
    'Germany': 'de',
    'Greece': 'gr',
    'Hong Kong': 'hk',
    'Hungary': 'hu',
    'India': 'in',
    'Indonesia': 'id',
    'Ireland': 'ie',
    'Israel': 'il',
    'Italy': 'it',
    'Japan': 'jp',
    'Latvia': 'lv',
    'Lithuania': 'lt',
    'Malaysia': 'my',
    'Mexico': 'mx',
    'Morocco': 'ma',
    'Netherlands': 'nl',
    'New Zealand': 'nz',
    'Nigeria': 'ng',
    'Norway': 'no',
    'Philippines': 'ph',
    'Poland': 'pl',
    'Portugal': 'pt',
    'Romania': 'ro',
    'Saudi Arabia': 'sa',
    'Serbia': 'rs',
    'Singapore': 'sg',
    'Slovakia': 'sk',
    'Slovenia': 'si',
    'South Africa': 'za',
    'South Korea': 'kr',
    'Sweden': 'se',
    'Switzerland': 'ch',
    'Taiwan': 'tw',
    'Thailand': 'th',
    'Turkey': 'tr',
    'Ukraine': 'ua',
    'United Arab Emirates': 'ae',
    'United Kingdom': 'gb',
    'United States': 'us',
    'Venezuela': 've',
  };

  void onCountryChanged(String? country) {
    if (country != null && countryCodes.containsKey(country)) {
      setState(() {
        selectedCountry = country;
      });
      widget.onCountryChanged(countryCodes[country]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: DropdownButton<String>(
            isExpanded: true, // Allow the dropdown to expand
            value: selectedCountry,
            items: countryCodes.keys.map((countryName) {
              return DropdownMenuItem(
                value: countryName,
                child: Text(
                  countryName,
                  style: AppStyles.styleMedium16,
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              );
            }).toList(),
            onChanged: onCountryChanged,
          ),
        ),
        const SizedBox(width: 55),
        IconButton(
          color: AppColors.secondaryColor,
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
