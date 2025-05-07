class EventModel {
  final String id;
  final String title;
  final String imageUrl;

  EventModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory EventModel.fromMap(String id, Map<String, dynamic> data) {
    return EventModel(
        id: id, title: data['title'] ?? '', imageUrl: data['image_url'] ?? "");
  }
}
