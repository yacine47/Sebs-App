import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  const ReviewModel({
    required this.id,
    required this.simpleUserId,
    required this.eventId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? simpleUserId;
  final int? eventId;
  final int? rating;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      simpleUserId: json["simple_user_id"],
      eventId: json["event_id"],
      rating: json["rating"],
      comment: json["comment"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "simple_user_id": simpleUserId,
        "event_id": eventId,
        "rating": rating,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        simpleUserId,
        eventId,
        rating,
        comment,
        createdAt,
        updatedAt,
      ];
}
