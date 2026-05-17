import 'package:equatable/equatable.dart';

class CooldownEntity extends Equatable {
  final DateTime nextEligibleDate;
  final int daysRemaining;
  final bool isEligible;

  const CooldownEntity({
    required this.nextEligibleDate,
    required this.daysRemaining,
    required this.isEligible,
  });

  @override
  List<Object?> get props => [nextEligibleDate, daysRemaining, isEligible];
}
