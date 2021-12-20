
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/screens/DetailedScreen/detailled_screen.dart';


class LocationCell extends StatelessWidget {
  const LocationCell({Key? key, required this.location, required this.comingFromFav}) : super(key: key);
  final bool comingFromFav;
 final City location;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final list = [
      Text(
        location.name??"",
        style: theme.textTheme.subtitle1,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(
        height: 12,
      ),
      SizedBox(
        width: 180,
        child: Text(
          location.type??"",
          textAlign: TextAlign.left,
          style: theme.textTheme.caption,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

        ),
      ),
      const SizedBox(
        height: 12,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              location.zone??"",
              textAlign: TextAlign.left,
              style: theme.textTheme.caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

            ),
          ),

        ],
      ),
    ];
    return GestureDetector(
      onTap: (){ comingFromFav?Get.off(DetailedScreen(Restraunt: location, comeFromFavorite: comingFromFav,)):Get.to(DetailedScreen(Restraunt: location, comeFromFavorite: comingFromFav,));},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 7.0, horizontal: 16),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: Get.width*0.95,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(
                  Radius.circular(8) //                 <--- border radius here]8
              ),
            ),
            child: Flex(
                direction: Axis.horizontal,
                children: [
                  location.images![0]==" "?
                        Image.asset("assets/icons/Component 7 – 1@3x.png",height: 290,width: Get.width*0.4,)
                   :ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        location.images![0].removeAllWhitespace,
                        fit: BoxFit.fill,
                        width: 104,
                        height: 104,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...list,
                          const SizedBox(
                            height: 8,
                          ),

                        ],
                      ),
                    ),
                  ),
                ]),
          ),

        ]),
      ),
    );
  }
}
