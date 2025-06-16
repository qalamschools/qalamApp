

class NewsModel {
  final String id;
  final String title;
  final String url;
  final String type;

  NewsModel(
      {required this.id,
      required this.title,
      required this.url,
      required this.type});

  factory NewsModel.fromMap(String id, Map<String, dynamic> data) {
    return NewsModel(
      id: id,
      title: data['title'] ?? '',
      url: data['url'] ?? "",
      type: data['type'],
    );
  }
}
