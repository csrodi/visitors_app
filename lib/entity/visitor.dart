import 'package:json_annotation/json_annotation.dart';

part 'visitor.g.dart';

@JsonSerializable(includeIfNull: false)
class Visitor {
  int id;

  String lastName;

  String firstName;

  String phoneNumber;

  String email;

  Visitor(
      {this.id, this.lastName, this.firstName, this.phoneNumber, this.email});

  factory Visitor.fromJson(Map<String, dynamic> json) => _$VisitorFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorToJson(this);

}
