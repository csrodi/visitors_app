import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(includeIfNull: false)
class Event {
  int id;

  String title;

  String description;

  DateTime startDateTime;

  DateTime endDateTime;

  bool isPublic;

  String contact;

  Event({this.id, this.title, this.description, this.startDateTime, this.endDateTime, this.isPublic, this.contact});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
