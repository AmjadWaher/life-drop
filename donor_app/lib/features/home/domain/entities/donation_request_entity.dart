import 'package:equatable/equatable.dart';

enum UrgencyLevel { high, medium, low, scheduled }

class DonationRequestEntity extends Equatable {
  final String id;
  final String bloodType;
  final UrgencyLevel urgency;
  final double distanceKm;
  final String hospitalName;
  final String description;

  const DonationRequestEntity({
    required this.id,
    required this.bloodType,
    required this.urgency,
    required this.distanceKm,
    required this.hospitalName,
    required this.description,
  });

  bool get isUrgent => urgency == UrgencyLevel.high;

  @override
  List<Object?> get props => [
    id,
    bloodType,
    urgency,
    distanceKm,
    hospitalName,
    description,
  ];
}
