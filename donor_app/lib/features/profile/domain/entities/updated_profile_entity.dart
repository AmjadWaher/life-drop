import 'package:equatable/equatable.dart';

class UpdatedProfileEntity extends Equatable {
  final String userId;
  final bool isAvailable;
  final String governorateName;
  final String districtName;
  final bool receiveCriticalNotifications;
  final bool receiveUrgentNotifications;
  final bool receiveNormalNotifications;

  const UpdatedProfileEntity({
    required this.userId,
    required this.isAvailable,
    required this.governorateName,
    required this.districtName,
    required this.receiveCriticalNotifications,
    required this.receiveUrgentNotifications,
    required this.receiveNormalNotifications,
  });

  @override
  List<Object?> get props => [
    userId,
    isAvailable,
    governorateName,
    districtName,
    receiveCriticalNotifications,
    receiveUrgentNotifications,
    receiveNormalNotifications,
  ];
}
