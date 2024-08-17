class DatasModel {
  final String? image;
  final String title;
  final String? description;
  final String? url;

  DatasModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.url});
  factory DatasModel.fromJson(json) {
    return DatasModel(
      image: json['image'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
