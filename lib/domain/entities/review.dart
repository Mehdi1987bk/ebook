import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Review {
  final int id;
  final dynamic reviewerId;
  final int ebookId;
  final int rating;
  final String reviewerName;
  final String comment;
  final bool isApproved;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review(
      {required this.id,
      this.reviewerId,
      required this.ebookId,
      required this.rating,
      required this.reviewerName,
      required this.comment,
      required this.isApproved,
      required this.createdAt,
      required this.updatedAt});

factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
