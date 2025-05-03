class NewAndMediaModel {
  final String title;
  final String videoUrl;

  NewAndMediaModel({required this.title, required this.videoUrl});

  NewAndMediaModel copyWith({String? title, String? videoUrl}) {
    return NewAndMediaModel(
        title: title ?? this.title, videoUrl: videoUrl ?? this.videoUrl);
  }
}
