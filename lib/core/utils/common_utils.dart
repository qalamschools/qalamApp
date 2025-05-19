import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  static Future<void> urlLauncher({required String url}) async {
    final Uri uri;

    if (url.startsWith("http") ||
        url.startsWith("mailto:") ||
        url.startsWith("tel:")) {
      uri = Uri.parse(url);
    } else if (RegExp(r'^\d{10,15}$').hasMatch(url)) {
      // Likely a phone number for WhatsApp
      uri = Uri.parse("https://wa.me/+44$url");
    } else {
      uri = Uri.parse("https://$url");
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }

  static Future<void> openDialer({required String number}) async {
    String phoneNumber = "tel:$number";
    final Uri uri = Uri.parse(phoneNumber);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $phoneNumber';
    }
  }

  static (bool, String) validateEmail(String email) {
    if (email.isEmpty) {
      return (false, "email is empty");
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return (emailRegex.hasMatch(email), "");
  }
}
