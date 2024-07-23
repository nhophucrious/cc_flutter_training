import 'package:cc_flutter_training/ui/models/address_model.dart';
import 'package:cc_flutter_training/ui/models/company_model.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@entity
class User {
  @primaryKey
  final int id;
  final String name;
  final String username;
  final String email;
  @TypeConverters([AddressConverter])
  final Address address;
  final String phone;
  final String website;
  @TypeConverters([CompanyConverter])
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}