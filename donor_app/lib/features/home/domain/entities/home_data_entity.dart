import 'package:donor_app/features/home/domain/entities/donation_request_entity.dart';
import 'package:equatable/equatable.dart';

class HomeDataEntity extends Equatable {
  final String username;
  final int remainingDays;
  final int totalContributions;
  final List<DonationRequestEntity> activeRequests;

  const HomeDataEntity({
    required this.username,
    required this.remainingDays,
    required this.totalContributions,
    required this.activeRequests,
  });

  factory HomeDataEntity.placeHolder() => HomeDataEntity(
    username: 'placeholder',
    remainingDays: 0,
    totalContributions: 0,
    activeRequests: [DonationRequestEntity.placeholder()],
  );

  @override
  List<Object?> get props => [
    username,
    remainingDays,
    totalContributions,
    activeRequests,
  ];
}
