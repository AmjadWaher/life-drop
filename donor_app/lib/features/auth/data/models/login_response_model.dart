import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/login_response_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
