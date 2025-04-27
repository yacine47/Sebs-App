import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:sebs_app/constants.dart';
import 'package:sebs_app/core/models/category_model.dart';
import 'package:sebs_app/core/models/review_model.dart';

class EventModel extends Equatable {
  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.categoryId,
    required this.status,
    required this.image,
    required this.location,
    required this.eventManagerId,
    required this.limitNumber,
    required this.averageRating,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.eventManager,
    required this.reviews,
  });

  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final String? startTime;
  final String? endTime;
  final int? categoryId;
  final String? status;
  final String? image;
  final String? location;
  final int? eventManagerId;
  final int? limitNumber;
  final num? averageRating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CategoryModel? category;
  final CategoryModel? eventManager;
  final List<ReviewModel> reviews;

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      date: DateTime.tryParse(json["date"] ?? ""),
      startTime: json["start_time"],
      endTime: json["end_time"],
      categoryId: json["category_id"],
      status: json["status"],
      image: kBaseUrlStorage + json["image"],
      location: json["location"],
      eventManagerId: json["event_manager_id"],
      limitNumber: json["limit_number"],
      averageRating: json["average_rating"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      category: json["category"] == null ? null : CategoryModel.fromJson(json["category"]),
      eventManager: json["event_manager"] == null ? null : CategoryModel.fromJson(json["event_manager"]),
      reviews: json["reviews"] == null ? [] : List<ReviewModel>.from(json["reviews"]!.map((x) => ReviewModel.fromJson(x))),
    );
  }

  static Future<String> getJson() {
    return rootBundle.loadString('assets/json/data_event.json');
  }

  factory EventModel.fromRawJson(String str) => EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "category_id": categoryId,
        "status": status,
        "image": image,
        "location": location,
        "event_manager_id": eventManagerId,
        "limit_number": limitNumber,
        "average_rating": averageRating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
        "event_manager": eventManager?.toJson(),
        "reviews": reviews.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        date,
        startTime,
        endTime,
        categoryId,
        status,
        image,
        location,
        eventManagerId,
        limitNumber,
        averageRating,
        createdAt,
        updatedAt,
        category,
        eventManager,
        reviews,
      ];

  static EventModel fakeEventModel = EventModel(
    id: 1,
    title: 'Sample Event',
    description: 'This is a sample event description.',
    date: DateTime(2025, 2, 12), // Feb 12
    startTime: '10:00 AM',
    endTime: '12:00 PM',
    categoryId: 5,
    status: 'active',
    image: '${kBaseUrlStorage}images/sample_event.jpg',
    location: 'New York City',
    eventManagerId: 3,
    limitNumber: 100,
    averageRating: 4.5,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: CategoryModel(
      id: 5,
      name: 'Music',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: 7,
    ),
    eventManager: CategoryModel(
      id: 3,
      name: 'John Doe',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: 2,
    ),
    reviews: [
      ReviewModel(
        id: 1,
        simpleUserId: 10,
        eventId: 1,
        rating: 5,
        comment: 'Amazing event!',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      ReviewModel(
        id: 2,
        simpleUserId: 11,
        eventId: 1,
        rating: 4,
        comment: 'Had a great time.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
  );
}
