import 'package:json_annotation/json_annotation.dart';

part 'send_declarations.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SendDeclarationRequest {
  final String trackingNo;
  final String price;

  SendDeclarationRequest({
   required this.trackingNo,
  required  this.price,
  });

  factory SendDeclarationRequest.fromJson(Map<String, dynamic> json) =>
      _$SendDeclarationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendDeclarationRequestToJson(this);
}
