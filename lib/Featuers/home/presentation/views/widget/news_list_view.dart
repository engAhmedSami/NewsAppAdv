import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<DatasModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: NewsTile(
              datasmodel: articles[index], // Pass DatasModel here
            ),
          );
        },
        childCount: articles.length,
      ),
    );
  }
}
