import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:ra7alah/models/fav_model.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/utils/services/api_service.dart';
import 'package:ra7alah/utils/services/app_routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteServices{
  final ref = FirebaseDatabase.instance.reference().child("Favorite");
  static ApiService api = ApiService();
  List<String> ids=[];
  getUserIdFromCach() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = await prefs.getString('userid');
    return stringValue;
  }
   checkIfThereIsFavoritesToTHisUser() async {
     var connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.none) {
       Get.offAndToNamed(AppRoutes.initialRoute);
     }
     final user = await getUserIdFromCach();
     var data = await ref.child(user).once();
     return data.value;
   }
  Future<void> addLocationToFavorite(City location) async {
    final user = await getUserIdFromCach();
    ref.child(user).child(location.id??"").set({
      'Name':location.name,
      'images':location.images,
      'zone':location.zone,
      'type':location.type,
      'locations':location.location,
      'description':location.description
    });
  }

  removeLocationFromFavorite(locationId) async {
    final user = await getUserIdFromCach();
    ref.child(user).child(locationId).remove();
  }

  detectLocationAddToFavorite(locationId) async {
    final user = await getUserIdFromCach();
    var data = await ref.child(user).child(locationId).once();
   return data.value;
  }
   getFavoriteIDArray(){
    return ids;
   }

   setFavoriteIDInArray(String IDs){
    ids.add(IDs);
   }

   getFavoriteData() async {
     var userId = await getUserIdFromCach();
     var data = await api.request("/Favorite/$userId.json", "GET");
     if (data != []) {
       List<Favorite> favs = [];
       var i = 0;
       print(data.keys);
       data.keys.forEach((element) {
         print("${i}${element}");
         setFavoriteIDInArray(element);
       });
       data.values.forEach((element) {
         print("${i}${element}");
         favs.add(Favorite.fromJson(element));
         i++;
       });
       return favs;
     }
   }
   }
