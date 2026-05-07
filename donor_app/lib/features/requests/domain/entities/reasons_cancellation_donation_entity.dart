import 'package:equatable/equatable.dart';

class ReasonsCancellationDonationEntity extends Equatable {
  final String id;
  final String displayName;
  final String displayNameAr;
  final String displayNameEn;

  const ReasonsCancellationDonationEntity({
    required this.id,
    required this.displayName,
    required this.displayNameAr,
    required this.displayNameEn,
  });

  @override
  List<Object?> get props => [id, displayName, displayNameAr, displayNameEn];
}
