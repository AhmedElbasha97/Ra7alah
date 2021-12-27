import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/screens/LocationsTableView/widget/location_cell.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/loading_widget.dart';
import 'package:ra7alah/widgets/tab_bar.dart';

import 'favorite_screen_controller.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  final favoriteScreenController cont =favoriteScreenController();

  @override


  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return GetBuilder<favoriteScreenController>(
        init: favoriteScreenController(),

        builder: (controller) {
      return Scaffold(

        bottomNavigationBar: BottomNavBar(index: 1,),
        appBar: const AppBarWidget(
          color: kWhiteColor, hasBackButton: false, title: "Favorite",),
        backgroundColor: kDarkWhiteColor,
        body: controller.loading? LoadingWidget():controller.noDataToShow?Center(
            child: Container(
              height: Get.height * 0.3,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Text("there's no Data to show",
                        textAlign: TextAlign.center,
                        style: extend(
                            theme.textTheme.headline3 ??
                                const TextStyle(),
                            const TextStyle(
                                color: kPrimaryColor)),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                    ),
                    Image.asset(
                      "assets/icons/Component 7 – 1@3x.png",
                      height: 290, width: Get.width * 0.4,),
                  ]),)):Center(
            child: ListView.builder(
              itemCount: controller.favs.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return LocationCell(location: City(id: controller.ids[index], type: controller.favs[index].type, zone: controller.favs[index].zone, name: controller.favs[index].name, location: controller.favs[index].locations, description: controller.favs[index].description,images: controller.favs[index].images, ),  comingFromFav: true,);
              },
            )),


      );
    });
  }
}
