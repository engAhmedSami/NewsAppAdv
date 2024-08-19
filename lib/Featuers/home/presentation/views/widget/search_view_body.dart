import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/Core/services/news_search_service.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/news_tile.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/news_tile_fade.dart';
import 'package:newsapp/constants.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  Future<List<DatasModel>>? _searchResults;

  void _onSearch() {
    setState(() {
      _searchResults =
          SearchNewsService(Dio(), searchController.text).searchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            textInputType: TextInputType.text,
            controller: searchController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a search term';
              }
              return null;
            },
            onSubmitted: (value) {
              searchController.text = value;

              _onSearch();
            }, // Trigger search on submit
          ),
          const SizedBox(height: 24),
          Expanded(
            child: _searchResults == null
                ? const Center(child: Text('Please enter a search term'))
                : FutureBuilder<List<DatasModel>>(
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SingleChildScrollView(
                            child: NewsTileFade());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            'Error occurred while fetching data',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final article = snapshot.data![index];
                            return NewsTile(
                                datasmodel: article // Pass DatasModel here
                                );
                          },
                        );
                      } else {
                        return const Center(child: Text('No results found'));
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
