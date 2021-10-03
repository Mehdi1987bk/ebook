// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      roleId: fields[1] as int,
      email: fields[2] as String,
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      mobile: fields[5] as String,
      passportSerie: fields[6] as String,
      passportNumber: fields[7] as String,
      passportFin: fields[8] as String,
      hasPhoto: fields[9] as String?,
      gender: fields[10] as Gender,
      birthday: fields[11] as String,
      locale: fields[12] as String,
      address: fields[13] as String,
      showRules: fields[14] as String?,
      emailVerifiedAt: fields[15] as DateTime?,
      createdAt: fields[16] as DateTime,
      updatedAt: fields[17] as DateTime,
      filialId: fields[18] as int?,
      customsLimit: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.roleId)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.mobile)
      ..writeByte(6)
      ..write(obj.passportSerie)
      ..writeByte(7)
      ..write(obj.passportNumber)
      ..writeByte(8)
      ..write(obj.passportFin)
      ..writeByte(9)
      ..write(obj.hasPhoto)
      ..writeByte(10)
      ..write(obj.gender)
      ..writeByte(11)
      ..write(obj.birthday)
      ..writeByte(12)
      ..write(obj.locale)
      ..writeByte(13)
      ..write(obj.address)
      ..writeByte(14)
      ..write(obj.showRules)
      ..writeByte(15)
      ..write(obj.emailVerifiedAt)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.updatedAt)
      ..writeByte(18)
      ..write(obj.filialId)
      ..writeByte(19)
      ..write(obj.customsLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      roleId: json['role_id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      mobile: json['mobile'] as String,
      passportSerie: json['passport_serie'] as String,
      passportNumber: json['passport_number'] as String,
      passportFin: json['passport_fin'] as String,
      hasPhoto: json['has_photo'] as String?,
      gender: _$enumDecode(_$GenderEnumMap, json['gender']),
      birthday: json['birthday'] as String,
      locale: json['locale'] as String,
      address: json['address'] as String,
      showRules: json['show_rules'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      filialId: json['filial_id'] as int?,
      customsLimit: json['customs_limit'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'role_id': instance.roleId,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'passport_serie': instance.passportSerie,
      'passport_number': instance.passportNumber,
      'passport_fin': instance.passportFin,
      'has_photo': instance.hasPhoto,
      'gender': _$GenderEnumMap[instance.gender],
      'birthday': instance.birthday,
      'locale': instance.locale,
      'address': instance.address,
      'show_rules': instance.showRules,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'filial_id': instance.filialId,
      'customs_limit': instance.customsLimit,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
