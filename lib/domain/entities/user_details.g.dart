// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

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
      hasPhoto: json['has_photo'] as String,
      gender: json['gender'] as String,
      birthday: json['birthday'] as String,
      locale: json['locale'] as String,
      address: json['address'] as String,
      showRules: json['show_rules'] as String,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      filialId: json['filial_id'] as int,
      customsLimit: json['customs_limit'] as String,
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
      'gender': instance.gender,
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
