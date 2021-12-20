import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/screens/loginScreen/login_screen.dart';
import 'package:ra7alah/screens/signupScreen/signup_controller.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/custom_elevated_button.dart';
import 'package:ra7alah/widgets/input_field_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
        appBar:  const AppBarWidget(hasElevation: false,color: kBackgroundColor,),
        body: GetBuilder<SignupController>(
            init: SignupController(),
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
                            "Sign Up",
                            style: extend(theme.textTheme.headline2 ?? const TextStyle(),const TextStyle(color: kDarkGrayColor)),
                          ),
                          const SizedBox(height: 75),
                          CustomInputfield(
                            onchange: controller.onNameupdate,
                            labelText: "Name",
                            controller: controller.nameController,
                            validator: controller.validateName,
                            icon: (controller.nameValidated)
                                ? (controller.nameState)
                                    ? const Icon(Icons.check_rounded,
                                        color: kSuccessColor)
                                    : const Icon(
                                        Icons.close_outlined,
                                        color: kErrorColor,
                                      )
                                : null,
                          ),
                          const SizedBox(height: 8),

                          CustomInputfield(
                            onchange: controller.onEmailUpdate,
                            labelText: "Email",
                            controller: controller.emailController,
                            validator: controller.validateEmail,
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
                          const SizedBox(height: 8),
                          CustomInputfield(
                              labelText: "Password",
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              isAutoValidate: true,
                              obsecure: !controller.visiblePsd,
                              keyboardType: TextInputType.visiblePassword,
                              icon: IconButton(
                                // Based on passwordVisible state choose the icon
                                icon: Icon(
                                  controller.visiblePsd
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  controller.toggleVisiblePsd();
                                },
                              )),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(LoginScreen());
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("Already Have An Account",style: TextStyle(color: kDarkGrayColor),),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: kPrimaryColor,
                                      ),
                      ],
                    )),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: CustomElevatedButton(
                              background: kPrimaryColor,
                                width: 343,
                                height: 48,
                                onPressed: () {
                                  controller.sinningUP(context);
                                },
                                text: "SIGN UP"),
                          ),
                          const SizedBox(height: 126),

                        ],
                      ),
                    ),
                  ),
                )));
  }
}
