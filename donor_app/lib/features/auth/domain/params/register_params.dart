import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_params.g.dart';

@JsonSerializable()
class RegisterParams {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phone;
  final String password;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;
  @JsonKey(name: 'blood_type')
  final String bloodType;

  const RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.bloodType,
  });

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}
