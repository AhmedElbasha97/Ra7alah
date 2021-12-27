import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/screens/LocationsTableView/widget/location_cell.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/tab_bar.dart';


class LocationTableViewScreen extends StatefulWidget {
  const LocationTableViewScreen({Key? key, required this.locations}) : super(key: key);
  final Location locations;
  @override
  _RestrauntTableViewScreen createState() => _RestrauntTableViewScreen();
}

class _RestrauntTableViewScreen extends State<LocationTableViewScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 0,),
      appBar: const AppBarWidget(color: kWhiteColor,hasBackButton: true,title: "Restraunt",),
      backgroundColor: kDarkWhiteColor,
      body: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(widget.locations.image,width: double.infinity,height: Get.height*0.29,fit: BoxFit.fill,),

                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Text(
                        widget.locations.gov,
                        textAlign: TextAlign.left,
                        style:extend(theme.textTheme.headline3??const TextStyle(), const TextStyle(color: kWhiteColor)),
                      ),
                    ), ),
                ],
              ),
              Container(
                height: Get.height*0.5-(MediaQuery.of(context).padding.bottom + 30),
                child: ListView.builder(
                  itemCount: widget.locations.city.length,
                  itemBuilder:
                      (BuildContext context, int index) {
                        return LocationCell(location: widget.locations.city[index], comingFromFav: false,);
                  },
                ),
              ),
            ],
          )) ,



    );
  }
}
