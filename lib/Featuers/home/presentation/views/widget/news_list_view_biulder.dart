import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';
import 'package:newsapp/Core/services/news_services.dart';
import 'package:dio/dio.dart';
import 'news_tile.dart';
import 'news_tile_fade.dart'; // Import your custom shimmer widget

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
    required this.selectedCountryCode,
  });

  final String category;
  final String selectedCountryCode;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  final ScrollController _scrollController = ScrollController();
  final List<DatasModel> _articles = [];
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchNews();
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsListViewBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category ||
        widget.selectedCountryCode != oldWidget.selectedCountryCode) {
      _resetAndFetchNews();
    }
  }

  Future<void> _fetchNews() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newArticles =
          await NewsService(Dio(), widget.selectedCountryCode).news(
        category: widget.category,
      );

      setState(() {
        _articles.addAll(newArticles);
        _isLoading = false;
        _hasMore = newArticles.isNotEmpty;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasMore = false;
      });
    }
  }

  void _resetAndFetchNews() {
    setState(() {
      _articles.clear();
      _hasMore = true;
      _isLoading = false;
    });
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index < _articles.length) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: NewsTile(datasmodel: _articles[index]),
            );
          } else if (_hasMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: NewsTileFade(), // Use the placeholder
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        childCount: _articles.length + (_hasMore ? 10 : 0),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
