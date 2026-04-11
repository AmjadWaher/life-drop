import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class UserEntity {
  final String id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String phone;
  @JsonKey(name: 'blood_type')
  final String bloodType;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.bloodType,
  });

  String get fullName => '$firstName $lastName';
}
