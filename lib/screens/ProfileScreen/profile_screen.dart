import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/screens/ProfileScreen/profile_controller.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/button.dart';
import 'package:ra7alah/widgets/loading_widget.dart';
import 'package:ra7alah/widgets/tab_bar.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavBar(index: 2,),
        backgroundColor: kDarkWhiteColor,
        appBar: const AppBarWidget(
          color: kWhiteColor, hasBackButton: false, title: "Profile",),
        body: controller.loaded? LoadingWidget():Center(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UserName: ${controller.user.name}",
                    textAlign: TextAlign.left,
                    style: extend(theme.textTheme.headline5 ?? const TextStyle(),
                        const TextStyle(color: kBlackColor)),
                  ),
                  SizedBox(height: Get.height * 0.01,),
                  Text(
                    "Email: ${controller.user.email}",
                    textAlign: TextAlign.left,
                    style: extend(theme.textTheme.headline5 ?? const TextStyle(),
                        const TextStyle(color: kBlackColor)),
                  ),
                ],
              ),


              SizedBox(height: Get.height * 0.5-(MediaQuery.of(context).padding.bottom + 60),),
              RoundedCornerButton(borderRadius: 25.0,
                title: "Sign Out",
                hasBorder: true,
                height: 48,
                width: Get.width * 0.95,
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  controller.signingOut();
                },
                textColor: kWhiteColor,),

            ],
          ),
        ),
      );
    });
  }
}
