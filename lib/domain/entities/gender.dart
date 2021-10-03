import 'package:hive_flutter/adapters.dart';

part 'gender.g.dart';

@HiveType(typeId: 2)
enum Gender {
  @HiveField(1)
  male,
  @HiveField(2)
  female,
}
