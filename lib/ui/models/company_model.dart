import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

class CompanyConverter extends TypeConverter<Company, String> {
  @override
  Company decode(String databaseValue) {
    return Company.fromJson(json.decode(databaseValue));
  }

  @override
  String encode(Company value) {
    return json.encode(value.toJson());
  }
}