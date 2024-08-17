import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/constants.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizintalPadding,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            textInputType: TextInputType.text,
            controller: searchController,
          )
        ],
      ),
    );
  }
}
