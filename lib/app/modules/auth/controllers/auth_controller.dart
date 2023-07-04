import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserAuthLoginController extends GetxController {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
}
