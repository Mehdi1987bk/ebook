import 'package:json_annotation/json_annotation.dart';

part 'tariff_baku.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tariff {
  Tariff({
    required this.title,
    required this.desc,
    required this.prices,
  });

  final String title;
  final String desc;
  final List<Price> prices;

  factory Tariff.fromJson(Map<String, dynamic> json) => _$TariffFromJson(json);

  Map<String, dynamic> toJson() => _$TariffToJson(this);
}






@JsonSerializable(fieldRename: FieldRename.snake)
class Price {
  Price({
    required this.min,
     this.max,
    required this.oldPrices,
    required this.newPrices,
  });

  final String min;
  final String? max;
  final String oldPrices;
  final String newPrices;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}








@JsonSerializable(fieldRename: FieldRename.snake)
class Hecmsel {
  Hecmsel({
    required this.title,
    required this.desc,
    required this.price,
  });

  final String title;
  final String desc;
  final String price;

factory Hecmsel.fromJson(Map<String, dynamic> json) => _$HecmselFromJson(json);

Map<String, dynamic> toJson() => _$HecmselToJson(this);
}
