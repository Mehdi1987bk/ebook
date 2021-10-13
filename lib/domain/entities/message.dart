import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Message {
  final int id;
  final int userId;
  final int? messageId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic readAt;

  Message(
      {required this.id,
      required this.userId,
      required this.messageId,
      required this.title,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.readAt});

factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

Map<String, dynamic> toJson() => _$MessageToJson(this);

}
