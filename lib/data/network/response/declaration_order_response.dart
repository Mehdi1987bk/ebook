import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/packages_counts.dart';
import 'package:kango/domain/entities/pagination.dart';

part 'declaration_order_response.g.dart';
@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class GetSubscribedListResponse {
  GetSubscribedListResponse({
    required this.packages,
    required this.packagesCounts,
  });



  final Pagination<Declaration> packages;
  final PackagesCounts packagesCounts;

factory GetSubscribedListResponse.fromJson(Map<String, dynamic> json) => _$GetSubscribedListResponseFromJson(json);

Map<String, dynamic> toJson() => _$GetSubscribedListResponseToJson(this);
}