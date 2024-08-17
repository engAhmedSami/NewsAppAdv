import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        context,
        title: 'Search',
      ),
      body: const SearchViewBody(),
    );
  }
}
