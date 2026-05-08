import 'package:donor_app/core/enums/blood_type.dart';
import 'package:donor_app/core/enums/donation_status.dart';
import 'package:donor_app/core/enums/urgency_status.dart';
import 'package:equatable/equatable.dart';

class ActiveDonationEntity extends Equatable {
  final String acceptanceId;
  final String requestId;
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalPhoneNumber;
  final double hospitalLatitude;
  final double hospitalLongitude;
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
