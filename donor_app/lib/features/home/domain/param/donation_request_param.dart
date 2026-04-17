class DonationRequestParam {
  final String bloodType;
  final String urgencyStatus;
  final String distanceAway;
  final String hospitalName;
  final String description;

  DonationRequestParam({
    required this.bloodType,
    required this.urgencyStatus,
    required this.distanceAway,
    required this.hospitalName,
    required this.description,
  });
}
