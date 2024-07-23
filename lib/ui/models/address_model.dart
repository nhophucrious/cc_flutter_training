import 'dart:convert';

import 'package:cc_flutter_training/ui/models/geo_model.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

class AddressConverter extends TypeConverter<Address, String> {
  @override
  Address decode(String databaseValue) {
    return Address.fromJson(json.decode(databaseValue));
  }

  @override
  String encode(Address value) {
    return json.encode(value.toJson());
  }
}