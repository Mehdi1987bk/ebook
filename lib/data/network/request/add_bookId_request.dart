import 'package:json_annotation/json_annotation.dart';
part 'add_bookId_request.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AddBookIdRequest{
  final int ebookId;

  AddBookIdRequest(this.ebookId);

factory AddBookIdRequest.fromJson(Map<String, dynamic> json) => _$AddBookIdRequestFromJson(json);

Map<String, dynamic> toJson() => _$AddBookIdRequestToJson(this);

}