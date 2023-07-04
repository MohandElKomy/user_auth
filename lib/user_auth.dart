library user_auth;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_auth/app/core/Customize/custom_widgets/custom_button.dart';

import 'app/core/Customize/custom_widgets/custom_textformfield.dart';
import 'app/core/Customize/utils/app_validator.dart';
import 'app/core/theme/colors.dart';
import 'app/modules/auth/controllers/auth_controller.dart';

class UserLogin extends GetView<AuthController> {
  const UserLogin({
    super.key,
    required this.user,
    required this.onPress,
    required this.loading,
  });

  final UserTypes user;
  final void Function() onPress;
  final RxBool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Expanded(
          child: Form(
            key: controller.form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    return AppValid.validName(value!);
                  },
                ),
                user == UserTypes.phone
                    ? const SizedBox()
                    : Column(
                  children: [
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: controller.userController,
                      textPadding: 1,
                      text: 'password',
                      hint: 'write your password',
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
                  ],
                ),
                const SizedBox(height: 40),
                Obx(
                      () =>
                      CustomProgressButton(
                        value: 'Sign in'.tr,
                        activeColor: AppColors.black,
                        isLoading: loading.value,
                        height: 50,
                        border: 40,
                        textStyle: (_) =>
                        const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ReadexPro',
                          color: AppColors.white,
                        ),
                        onPressed: loading.value ? () {} : onPress,
                      ),
                ),
              ],
            ),
          ),
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
