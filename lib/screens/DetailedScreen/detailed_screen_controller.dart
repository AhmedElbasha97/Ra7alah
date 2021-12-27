import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:ra7alah/Services/favorite_services.dart';
import 'package:ra7alah/models/location_model.dart';

class DetailedScreenController extends GetxController {
  final FavoriteServices fav = new FavoriteServices();
  final id;
  var notDetect = false;
  var loaded ;
  DetailedScreenController(this.id);
  Future<void> onInit() async {
    detectAddedToFavorite(id);
    super.onInit();
  }
  addToFavorite(City restrunt){
    print("elmat3am ${restrunt}");
    fav.addLocationToFavorite(restrunt);
    detectAddedToFavorite(restrunt.id);
  }

  detectAddedToFavorite(restrauntId) async {
    var detect = await fav.detectLocationAddToFavorite(restrauntId);
    print(detect);
    if( detect != null){
      notDetect = false;
    }else{
      notDetect=true;
    };
    update();
  }

  removeFromId(restrauntId) async {
   await fav.removeLocationFromFavorite(restrauntId);
    detectAddedToFavorite(restrauntId);
  }
}