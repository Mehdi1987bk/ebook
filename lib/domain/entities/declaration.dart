import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'order.dart';

part 'declaration.g.dart';

@JsonSerializable( fieldRename: FieldRename.snake)
class Declaration {
  Declaration({
    required this.id,
    required this.userId,
    required this.type,
    required this.ordersTotal,
    required this.ordersTotalUsd,
    required this.serviceFee,
    required this.additionalServicesTotal,
    required this.cargoWeight,
    required this.cargoTotal,
    required this.combinedPackage,
    required this.status,
    required this.cargoSentAt,
    required this.filialId,
    required this.courierSentAt,
    required this.statusStr,
    required this.externalWarehouseId,
    required this.scStatus,
    required this.scStatusFront,
    required this.fullCode,
    required this.scStatusColor,
    required this.orders,
  });

  final int id;
  final int userId;
  final String type;
  final double ordersTotal;
  final String ordersTotalUsd;
  final int serviceFee;
  final int additionalServicesTotal;
  final String cargoWeight;
  final String cargoTotal;
  final String combinedPackage;
  final int status;
  final int scStatus;
  final DateTime? cargoSentAt;
  final DateTime? courierSentAt;
  final int filialId;
  final String statusStr;
  final int externalWarehouseId;
  final String scStatusFront;
  final String scStatusColor;
  final String fullCode;
  final List<Order> orders;
  @JsonKey(ignore: true)
  bool customerCanEdit = false;

  factory Declaration.fromJson(Map<String, dynamic> json) =>
      _$DeclarationFromJson(json);


  Map<String, dynamic> toJson() => _$DeclarationToJson(this);
}
