class Datum {
  String? author;
  String? title;
  String? description;
  String? url;
  String? source;
  String? image;
  String? category;
  String? language;
  String? country;
  String? publishedAt;

  Datum({
    this.author,
    this.title,
    this.description,
    this.url,
    this.source,
    this.image,
    this.category,
    this.language,
    this.country,
    this.publishedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        source: json['source'] as String?,
        image: json['image'] as String?,
        category: json['category'] as String?,
        language: json['language'] as String?,
        country: json['country'] as String?,
        publishedAt: json['published_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'source': source,
        'image': image,
        'category': category,
        'language': language,
        'country': country,
        'published_at': publishedAt,
      };
}
