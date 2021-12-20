import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/screens/LocationsTableView/locations_table_view_screen.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';

class HomeCell extends StatelessWidget {
  const HomeCell({Key? key, required this.title, required this.subTitle, required this.location}) : super(key: key);
  final String title;
  final String subTitle;
  final Location location;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){

        Get.to(LocationTableViewScreen( locations: location,));

      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0,0.0),
            height: 65,
            width: double.infinity,
            decoration:  const BoxDecoration(
              border:  Border(
                bottom: BorderSide(width: 1.0, color: kGrayColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 10,),
                    Text(title,style: theme.textTheme.subtitle1,),
                    const SizedBox(height: 10,),
                    Text(subTitle,style: extend(theme.textTheme.caption ?? const TextStyle(), const TextStyle(color: kGrayColor))),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios,color: kGrayColor,size: 15.0,)
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
