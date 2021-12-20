
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/custom_elevated_button.dart';
import 'package:ra7alah/widgets/input_field_text.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar:  const AppBarWidget(hasElevation: false,color: kBackgroundColor,),
        body: GetBuilder<ForgotPasswordController>(
            init: ForgotPasswordController(),
            builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Forget Password",
                            style: extend(theme.textTheme.headline2 ?? const TextStyle(),const TextStyle(color: kDarkGrayColor)),
                          ),
                          const SizedBox(height: 87),
                          const Text(
                              "Please, enter your email address. You will receive a link to create a new password via email.",style:TextStyle(color: kDarkGrayColor)),
                          const SizedBox(height: 18),
                          CustomInputfield(
                            onchange: controller.onUpdate,
                            labelText: "Email",
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                            validated: controller.emailValidated,
                            icon: (controller.emailValidated)
                                ? (controller.emailState)
                                    ? const Icon(Icons.check_rounded,
                                        color: kSuccessColor)
                                    : const Icon(
                                        Icons.close_outlined,
                                        color: kErrorColor,
                                      )
                                : null,
                          ),
                          SizedBox(height: 53),
                          Center(
                            child: CustomElevatedButton(
                              background: kPrimaryColor,
                                width: 343,
                                height: 48,
                                onPressed: () {
                                  controller.forgetPassword(context);
                                },
                                text: "SEND"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
