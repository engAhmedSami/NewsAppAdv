import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/news_services.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<DatasModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).news(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DatasModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 14,
              child: Text(
                'Oops!!! There was an error, please try again later.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 15,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
