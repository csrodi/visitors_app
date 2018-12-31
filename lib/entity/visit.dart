import 'package:json_annotation/json_annotation.dart';
import 'package:visitors_app/entity/event.dart';
import 'package:visitors_app/entity/visitor.dart';

part 'visit.g.dart';

@JsonSerializable(includeIfNull: false)
class Visit {
  int id;

  String badge;

  String contact;

  DateTime signInDateTime;

  DateTime signOutDateTime;

  Visitor visitor;

  Event event;

  Visit({this.id, this.badge, this.contact, this.signInDateTime, this.signOutDateTime, this.visitor, this.event});

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);

  Map<String, dynamic> toJson() => _$VisitToJson(this);
}
