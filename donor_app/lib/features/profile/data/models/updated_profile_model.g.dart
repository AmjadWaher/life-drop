// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updated_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatedProfileResponseModel _$UpdatedProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdatedProfileResponseModel(
  userId: json['userId'] as String,
  isAvailable: json['isAvailable'] as bool,
  governorateName: json['governorateName'] as String,
  districtName: json['districtName'] as String,
  receiveCriticalNotifications: json['receiveCriticalNotifications'] as bool,
  receiveUrgentNotifications: json['receiveUrgentNotifications'] as bool,
  receiveNormalNotifications: json['receiveNormalNotifications'] as bool,
);
