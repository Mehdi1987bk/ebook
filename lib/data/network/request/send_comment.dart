import 'package:json_annotation/json_annotation.dart';

part 'send_comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SendCommentRequest {
  final int rating;
  final String reviewerName;
  final String comment;

  SendCommentRequest(
      {required this.rating,
      required this.reviewerName,
      required this.comment});

  factory SendCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$SendCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendCommentRequestToJson(this);
}
