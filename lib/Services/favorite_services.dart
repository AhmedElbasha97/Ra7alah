import 'package:firebase_database/firebase_database.dart';
import 'package:ra7alah/models/fav_model.dart';
import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/utils/services/api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteServices{
  final ref = FirebaseDatabase.instance.reference().child("Favorite");
  static ApiService api = ApiService();
  List<String> ids=[];
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = await prefs.getString('userid');
    return stringValue;
  }
   checkIfThereIsFavoritesToTHisUser() async {
     final user = await getStringValuesSF();
     var data = await ref.child(user).once();
     return data.value;
   }
  Future<void> addToFavorite(City location) async {
    final user = await getStringValuesSF();
    ref.child(user).child(location.id??"").set({
      'Name':location.name,
      'images':location.images,
      'zone':location.zone,
      'type':location.type,
      'locations':location.location,
      'description':location.description
    });
  }

  removeFromFavorite(locationId) async {
    final user = await getStringValuesSF();
    ref.child(user).child(locationId).remove();
  }

  detectLocationAddToFavorite(locationId) async {
    final user = await getStringValuesSF();
    var data = await ref.child(user).child(locationId).once();
   return data.value;
  }
   getFavoriteID(){
    return ids;
   }

   setFavoriteID(String IDs){
    ids.add(IDs);
   }

   getFavoriteData() async {
     var userId = await getStringValuesSF();
     var data = await api.request("/Favorite/$userId.json", "GET");
     if (data != []) {
       List<Favorite> favs = [];
       var i = 0;
       print(data.keys);
       data.keys.forEach((element) {
         print("${i}${element}");
         setFavoriteID(element);
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
