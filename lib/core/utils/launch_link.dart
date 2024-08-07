import 'package:url_launcher/url_launcher.dart';

class LaunchLink {
  static launchPhone(String telephoneNumber) async {
    try {
      launchURL(telephoneNumber);
    } catch (e) {
      throw "Error occured trying to call that number.";
    }
  }

  static launchURL(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Error occured, cannot launch url.";
    }
  }
}
