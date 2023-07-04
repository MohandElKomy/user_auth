import 'package:get/get.dart';

class AppValid {
  static String? validPhone(value) {
    var pattern = r'(^01[0125][0-9]{8}$)';
    RegExp regExp = RegExp(pattern);
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      value = value!.replaceAll(arabic[i], english[i]);
    }
    if (value!.isEmpty) {
      return 'phone-empty-error'.tr;
    } else if (value!.length != 8) {
      return 'phone-valid-error'.tr;
    }
    return null;
  }

  static String? validName(val) {
    if (val!.length < 3) {
      return "please_enter_name".tr;
    }
    return null;
  }

  static String? validEmail(val) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(val) || val.isEmpty) {
      return "Enter Correct Password";
    } else {
      return null;
    }
  }
}
