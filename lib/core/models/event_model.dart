import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
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
  final int? averageRating;
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
      image: json["image"],
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
}
