import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  static Future<void> urlLauncher({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openDialer({required String number}) async {
    String phoneNumber = "tel:$number";
    final Uri uri = Uri.parse(phoneNumber);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $phoneNumber';
    }
  }
}
