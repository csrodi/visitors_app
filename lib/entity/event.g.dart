// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      endDateTime: json['endDateTime'] == null
          ? null
          : DateTime.parse(json['endDateTime'] as String),
      isPublic: json['isPublic'] as bool,
      contact: json['contact'] as String);
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('startDateTime', instance.startDateTime?.toIso8601String());
  writeNotNull('endDateTime', instance.endDateTime?.toIso8601String());
  writeNotNull('isPublic', instance.isPublic);
  writeNotNull('contact', instance.contact);
  return val;
}
