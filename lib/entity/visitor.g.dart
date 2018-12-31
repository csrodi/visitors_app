// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visitor _$VisitorFromJson(Map<String, dynamic> json) {
  return Visitor(
      id: json['id'] as int,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String);
}

Map<String, dynamic> _$VisitorToJson(Visitor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  return val;
}
