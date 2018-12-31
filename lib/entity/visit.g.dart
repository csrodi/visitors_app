// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visit _$VisitFromJson(Map<String, dynamic> json) {
  return Visit(
      id: json['id'] as int,
      badge: json['badge'] as String,
      contact: json['contact'] as String,
      signInDateTime: json['signInDateTime'] == null
          ? null
          : DateTime.parse(json['signInDateTime'] as String),
      signOutDateTime: json['signOutDateTime'] == null
          ? null
          : DateTime.parse(json['signOutDateTime'] as String),
      visitor: json['visitor'] == null
          ? null
          : Visitor.fromJson(json['visitor'] as Map<String, dynamic>),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>));
}

Map<String, dynamic> _$VisitToJson(Visit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('badge', instance.badge);
  writeNotNull('contact', instance.contact);
  writeNotNull('signInDateTime', instance.signInDateTime?.toIso8601String());
  writeNotNull('signOutDateTime', instance.signOutDateTime?.toIso8601String());
  writeNotNull('visitor', instance.visitor);
  writeNotNull('event', instance.event);
  return val;
}
