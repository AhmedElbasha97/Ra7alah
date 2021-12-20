import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/screens/FavoriteScreens/favorite_screen.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/styles.dart';
import 'package:ra7alah/utils/utils.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final title, hasBackButton, hasElevation, color,comeFromFavorite;
  final List<Widget>? actions;

  const AppBarWidget({
    Key? key,
    this.title,
    this.hasBackButton = true,
    this.hasElevation = true,
    this.actions,
    this.color = Colors.white, this.comeFromFavorite=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: hasElevation ? 1 : 0,
      centerTitle: true,
      backgroundColor: color==Colors.white?kWhiteColor:color,
      actions: actions,
      leading: hasBackButton
          ? IconButton(
              onPressed: () {
                comeFromFavorite?Get.to(const FavoriteScreen()):Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              ),
            )
          : Container(),
      title: Text(
        title ?? "",
        style: extend(
            Styles.kTextStyleHeadline3, const TextStyle(color: kBlackColor)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
