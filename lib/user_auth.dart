library user_auth;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_auth/app/core/Customize/custom_widgets/custom_button.dart';

import 'app/core/Customize/custom_widgets/custom_textformfield.dart';
import 'app/core/Customize/utils/app_validator.dart';
import 'app/core/theme/colors.dart';
import 'app/modules/auth/controllers/auth_controller.dart';

class UserLogin extends StatelessWidget {
  UserLogin({
    super.key,
    required this.user,
    required this.onPress,
    required this.loading,
    required this.color,
  });

  final UserAuthLoginController controller = Get.put(UserAuthLoginController());
  final UserTypes user;
  final void Function() onPress;
  final RxBool loading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: controller.form,
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller.userController,
              textPadding: 1,
              text: user == UserTypes.name
                  ? 'User Name'
                  : user == UserTypes.mail
                      ? 'User Mail'
                      : 'User Phone',
              hint: user == UserTypes.name
                  ? 'Write Your Name'
                  : user == UserTypes.mail
                      ? 'Write Your Mail'
                      : 'Write User Phone',
              borderRadius: 15,
              borderColor: AppColors.borderColor,
              isFilled: true,
              submit: () {},
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (user == UserTypes.name) {
                  return AppValid.validName(value!);
                } else if (user == UserTypes.phone) {
                  return AppValid.validPhone(value!);
                } else if (user == UserTypes.mail) {
                  return AppValid.validEmail(value!);
                }
                return null;
              },
            ),
            user == UserTypes.phone
                ? const SizedBox()
                : Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        textPadding: 1,
                        text: 'password',
                        hint: 'write your password',
                        borderRadius: 15,
                        borderColor: AppColors.borderColor,
                        isFilled: true,
                        submit: () {},
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          return AppValid.validPassword(value!);
                        },
                      ),
                    ],
                  ),
            const SizedBox(height: 40),
            Obx(
              () => CustomProgressButton(
                value: 'Sign in'.tr,
                activeColor: color,
                isLoading: loading.value,
                height: 50,
                border: 40,
                textStyle: (_) => const TextStyle(
                  fontSize: 20,
                  fontFamily: 'ReadexPro',
                  color: AppColors.white,
                ),
                onPressed: loading.value
                    ? () {}
                    : () {
                        if (!controller.form.currentState!.validate()) {
                          return;
                        }
                        controller.form.currentState!.save();
                        onPress();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum UserTypes {
  name,
  mail,
  phone,
}
