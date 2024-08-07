import 'package:intl/intl.dart';

extension StringExtension on String {
  ///check if the string is an email
  bool isEmail() {
    //email regex pattern
    String _emmailRegExpString =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp emmailRegExp = RegExp(_emmailRegExpString);
    return emmailRegExp.hasMatch(this);
  }

  ///check if the string is a web link
  bool isLink() {
    //email regex pattern
    String _linkRegExpString =
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";
    RegExp linkRegExp = RegExp(_linkRegExpString);
    return linkRegExp.hasMatch(this);
  }

  /// this would capitalize the first letter of the String
  String capitalize({lowercaseOther = false}) {
    String text = this;
    return "${text[0].toUpperCase()}${lowercaseOther ? text.substring(1).toLowerCase() : text.substring(1)}";
  }

  String toMoney() {
    var f = NumberFormat('###.0#', 'en_US');
    return f.format(this);
  }

  bool get isImage {
    try {
      final extensions = ["png", "jpg", "jpeg", "heic", "gif"];
      return extensions.contains(split(".").last.toLowerCase());
    } catch (e) {
      return false;
    }
  }

  bool get isDoc {
    try {
      final extensions = ["doc", "docx", "pdf"];
      return extensions.contains(split(".").last.toLowerCase());
    } catch (e) {
      return false;
    }
  }

  bool get isAudio {
    try {
      final extensions = ["mp3"];
      return extensions.contains(split(".").last.toLowerCase());
    } catch (e) {
      return false;
    }
  }

  bool get isVideo {
    try {
      final extensions = ["mp4", "mov"];
      return extensions.contains(split(".").last.toLowerCase());
    } catch (e) {
      return false;
    }
  }
}
