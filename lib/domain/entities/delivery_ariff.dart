import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/tariff_baku.dart';

part 'delivery_ariff.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryTariff{
final String desc;
final Tariff baku;
final Tariff regions;
final Hecmsel hecmsel;

  DeliveryTariff({required this.desc,required this.baku,required this.regions,required this.hecmsel});

factory DeliveryTariff.fromJson(Map<String, dynamic> json) => _$DeliveryTariffFromJson(json);

Map<String, dynamic> toJson() => _$DeliveryTariffToJson(this);
}