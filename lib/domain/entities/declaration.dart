import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'order.dart';

part 'declaration.g.dart';
@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)

class Declaration {
  Declaration({
    required this.id,
    required this.userId,
    required this.type,
    required this.ordersTotal,
    required this.serviceFee,
    required this.additionalServicesTotal,
    required this.deliveryMethod,
    required this.cargoWeight,
    required this.cargoTotal,
    required this.cargoWidth,
    required this.cargoHeight,
    required this.cargoAltitude,
    required this.cargoVolume,
    required this.invoiceCode,
    required this.combinedPackage,
    required this.fastDelivery,
    required this.status,
    required this.ulduzumCode,
    required this.pashaPromo,
    required this.openedById,
    required this.document,
    required this.cargoSentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.campaingId,
    required this.filialId,
    required this.cargoBoxId,
    required this.courierSentAt,
    required this.scStatus,
    required this.deletedBy,
    required this.cargoWeightPound,
    required this.ordersTotalUsd,
    required this.orders,
  });

  final int id;
  final int userId;
  final String type;
  final double ordersTotal;
  final int serviceFee;
  final int additionalServicesTotal;
  final int deliveryMethod;
  final String cargoWeight;
  final String cargoTotal;
  final dynamic cargoWidth;
  final dynamic cargoHeight;
  final dynamic cargoAltitude;
  final dynamic cargoVolume;
  final dynamic invoiceCode;
  final String combinedPackage;
  final String fastDelivery;
  final int status;
  final dynamic ulduzumCode;
  final dynamic pashaPromo;
  final dynamic openedById;
  final String document;
  final DateTime cargoSentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int campaingId;
  final int filialId;
  final int cargoBoxId;
  final DateTime? courierSentAt;
  final int scStatus;
  final dynamic deletedBy;
  final dynamic cargoWeightPound;
  final String ordersTotalUsd;
  final List<Order> orders;
  @JsonKey(ignore: true)
  bool isExpanded = false;

factory Declaration.fromJson(Map<String, dynamic> json) => _$DeclarationFromJson(json);

Map<String, dynamic> toJson() => _$DeclarationToJson(this);
}
