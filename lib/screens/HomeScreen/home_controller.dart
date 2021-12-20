import 'package:get/get.dart';
import 'package:ra7alah/Services/locations_services.dart';
import 'package:ra7alah/models/location_model.dart';


class HomeController extends GetxController{
  var loading = false;
  List<Location> govList = <Location>[];
  @override
  void onInit() {
    fetchGovernments();
    super.onInit();
  }
  void fetchGovernments() async {
    loading = true;
    var govs = await LocationService.getCategories();
    govList = govs ?? [];
    loading = false;
    update();


  }

}