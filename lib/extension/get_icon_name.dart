import '../constant/constant_path.dart';

extension IconNameEnumExtension on IconNameEnum {
  String get name {
    switch (this) {
      case IconNameEnum.facebook:
        return "Facebook";

      case IconNameEnum.twitter:
        return "Twitter";

      case IconNameEnum.instagram:
        return "Instagram";

      case IconNameEnum.whatsapp:
        return "Whatsapp";
    }
  }

  String get toPath {
    return '$name.png';
  }
}
