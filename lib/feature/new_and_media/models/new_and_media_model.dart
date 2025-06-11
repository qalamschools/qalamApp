class NewAndMediaModel {
  final String title;
  final String videoUrl;

  NewAndMediaModel({required this.title, required this.videoUrl});

  NewAndMediaModel copyWith({String? title, String? videoUrl}) {
    return NewAndMediaModel(
        title: title ?? this.title, videoUrl: videoUrl ?? this.videoUrl);
  }
}

class NewsModel {
  final String id;
  final String title;
  final String url;

  NewsModel({
    required this.id,
    required this.title,
    required this.url,
  });

  factory NewsModel.fromMap(String id, Map<String, dynamic> data) {
    return NewsModel(
      id: id,
      title: data['title'] ?? '',
      url: data['url'] ?? "",
    );
  }
}
