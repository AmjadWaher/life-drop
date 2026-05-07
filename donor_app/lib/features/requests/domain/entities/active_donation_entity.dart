import 'package:donor_app/core/enums/blood_type.dart';
import 'package:equatable/equatable.dart';

enum DonationStatus {
  accepted,
  fulfilled,
  cancelledByDonor,
  cancelledByHospital,
  noShow,
}

enum UrgencyStatus { normal, urgent, critical }

class ActiveDonationEntity extends Equatable {
  final String acceptanceId;
  final String requestId;
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalPhoneNumber;
  final int hospitalLatitude;
  final int hospitalLongitude;
  final BloodType requiredBloodType;
  final UrgencyStatus urgency;
  final int unitsRequested;
  final DonationStatus status;
  final DateTime acceptedAt;
  final int remainingMinutes;

  const ActiveDonationEntity({
    required this.acceptanceId,
    required this.requestId,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.hospitalPhoneNumber,
    required this.hospitalLatitude,
    required this.hospitalLongitude,
    required this.requiredBloodType,
    required this.urgency,
    required this.unitsRequested,
    required this.status,
    required this.acceptedAt,
    required this.remainingMinutes,
  });

  @override
  List<Object?> get props => [
    acceptanceId,
    requestId,
    hospitalName,
    hospitalAddress,
    hospitalPhoneNumber,
    hospitalLatitude,
    hospitalLongitude,
    requiredBloodType,
    urgency,
    unitsRequested,
    status,
    acceptedAt,
    remainingMinutes,
  ];
}
