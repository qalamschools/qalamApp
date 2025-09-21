import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String title;
  final String link;
  final String imageUrl;
  final DateTime date;

  EventModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.link,
  });

  factory EventModel.fromMap(String id, Map<String, dynamic> data) {
    return EventModel(
      id: id,
      title: data['title'] ?? '',
      imageUrl: data['image_url'] ?? "",
      date: (data['date'] as Timestamp).toDate(),
      link: data['link'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': Timestamp.fromDate(date),
    };
  }
}
