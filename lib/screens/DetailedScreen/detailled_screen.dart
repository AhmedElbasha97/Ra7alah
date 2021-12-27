import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/button.dart';

import 'detailed_screen_controller.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key, required this.Restraunt, required this.comeFromFavorite}) : super(key: key);
  final City Restraunt;
  final bool comeFromFavorite;

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
            onWillPop: () async => !widget.comeFromFavorite,
      child: GetBuilder<DetailedScreenController>(
          init: DetailedScreenController(widget.Restraunt.id),
          builder: (controller) {
        return Scaffold(
          backgroundColor: kDarkWhiteColor,
          appBar:  AppBarWidget(color: kWhiteColor,
            hasBackButton: true,
            title: "restraunt",
            comeFromFavorite: widget.comeFromFavorite,
           ),
          bottomNavigationBar: Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Colors.white,
            child: RoundedCornerButton(borderRadius: 25.0,
              title: "get Location",
              hasBorder: true,
              height: 48,
              width: Get.width * 0.95,
              backgroundColor: kPrimaryColor,
              onPressed: () async {
                await MapLauncher.showMarker(
                  mapType: MapType.google,
                  coords: Coords(double.parse(widget.Restraunt.location??[][0]),
                      double.parse(widget.Restraunt.location??[][1])),
                  title: widget.Restraunt.name??"",
                  description: "Restraunt location",
                );
              },
              textColor: kWhiteColor,),

          ),
          body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: Container(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.3,
                          child: Stack(
                            children: [

                              widget.Restraunt.images![0] == " " ? Container(
                                height: Get.height * 0.3,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text("there's no Image to show",
                                        textAlign: TextAlign.center,
                                        style: extend(
                                            theme.textTheme.headline3 ??
                                                TextStyle(),
                                            TextStyle(
                                                color: kPrimaryColor)),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,),
                                    ),
                                    Image.asset(
                                      "assets/icons/Component 7 – 1@3x.png",
                                      height: 290, width: Get.width * 0.4,),
                                  ],
                                ),
                              ) : Image.network(
                                (widget.Restraunt.images![0].removeAllWhitespace),
                                width: double.infinity,
                                height: Get.height * 0.4,
                                fit: BoxFit.fill,),
                              Positioned(
                                right: 0.0,
                                bottom: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 100,
                                    width: Get.height*.4,
                                    child: Text(
                                      widget.Restraunt.name??"",
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                      maxLines: 3,

                                      style: extend(
                                          theme.textTheme.headline3 ?? TextStyle(),
                                          widget.Restraunt.images![0] == " "
                                              ? TextStyle(color: kOnSaleColor)
                                              : TextStyle(color: kWhiteColor)),
                                    ),
                                  ),
                                ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Description:", style: extend(theme.textTheme
                            .headline5 ?? TextStyle(), const TextStyle(
                            color: kBlackColor)),),
                        SizedBox(height: 15,),
                        Text(widget.Restraunt.description??"",maxLines: 10, style: extend(theme
                            .textTheme.subtitle1 ?? TextStyle(), const TextStyle(
                            color: kBlackColor)),),
                        SizedBox(height: 15,),
                        Text("zone:", style: extend(theme.textTheme
                            .headline5 ?? TextStyle(), const TextStyle(
                            color: kBlackColor)),),
                        SizedBox(height: 15,),
                            Text(widget.Restraunt.zone??"", style: extend(
                                theme.textTheme.subtitle1 ?? TextStyle(),
                                const TextStyle(color: kBlackColor)),),
                        const SizedBox(height: 15,),
                        Text("Type:", style: extend(theme.textTheme
                            .headline5 ?? TextStyle(), const TextStyle(
                            color: kBlackColor)),),
                        SizedBox(height: 15,),
                        Text(widget.Restraunt.type??"", style: extend(
                            theme.textTheme.subtitle1 ?? TextStyle(),
                            const TextStyle(color: kBlackColor)),),
                        const SizedBox(height: 15,),
                        Text("Images:", style: extend(theme.textTheme.headline5 ??
                            TextStyle(), const TextStyle(color: kBlackColor)),),
                        SizedBox(height: 15,),
                        widget.Restraunt.images![0] == " " ? Container(
                          height: Get.height * 0.3,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Text("there's no images to show",
                                  textAlign: TextAlign.center, style: extend(
                                      theme.textTheme.headline3 ?? TextStyle(),
                                      TextStyle(
                                          color: kPrimaryColor)),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,),
                              ),
                              Image.asset("assets/icons/Component 7 – 1@3x.png",
                                height: 290, width: Get.width * 0.4,),
                            ],
                          ),
                        ) : GridView.count(
                          physics:
                          NeverScrollableScrollPhysics(),
                          // to disable GridView's scrolling
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          padding: EdgeInsets.all(10.0),
                          childAspectRatio: 6.5 / 8.0,
                          children: widget.Restraunt.images!.map(
                                (img) =>
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          img.removeAllWhitespace,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),).toList(),
                        ),
                        SizedBox(height: 15,),
                        RoundedCornerButton(borderRadius: 25.0,
                          title: controller.notDetect?"add to favorite":"remove from favorite",
                          icon: Icon(
                              controller.notDetect?Icons.favorite:Icons.favorite_border,
                            size: 15.0,
                              color: kWhiteColor
                          ),
                          hasBorder: true,
                          height: 48,
                          width: Get.width * 0.95,
                          backgroundColor: kPrimaryColor,
                          onPressed: () async {controller.notDetect?controller.addToFavorite(widget.Restraunt):controller.removeFromId(widget.Restraunt.id);},
                          textColor: kWhiteColor,)
                      ],
                    ),
                  ),
                )
            ),
          ),
        );
      }),
    );
  }
}
