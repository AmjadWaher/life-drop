import 'package:donor_app/core/networking/api_constants.dart';

class RequestsConstants {
  RequestsConstants._();

  static const String activeDonation =
      '${ApiConstants.donationRequests}/active';

  static String cancelDonationAcceptance(String requestId) =>
      '${ApiConstants.donationRequests}/$requestId/cancel-acceptance';

  static String reasonsCancellation =
      '${ApiConstants.referenceData}/cancellation-reasons';

  static String donationCertificate(String requestId) =>
      '${ApiConstants.baseUrl}/DonationRequests/$requestId/certificate';
}
