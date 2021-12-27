import 'package:get/get.dart';

import 'package:ra7alah/Services/favorite_services.dart';
import 'package:ra7alah/models/fav_model.dart';

class favoriteScreenController extends GetxController{

  final FavoriteServices fav =  FavoriteServices();
  var loaded = false;
  var noDataToShow = false;
  var showedAgain = false;
  List<Favorite> favs= [];
  List<String> ids= [];
  @override
  Future<void> onInit() async {
    checker();
    super.onInit();
  }
  screenShowedAgain(){
    showedAgain=true;
    if(showedAgain){
      checker();
    }
  }
  checker() async {
    var check = await fav.checkIfThereIsFavoritesToTHisUser();
    if(check!=null){
      getData();
    }else{
      loaded = false;
      noDataToShow = true;
      update();
    }
  }
  getData() async {
    noDataToShow = false;
    loaded = true;
   favs =  await fav.getFavoriteData();
   ids = fav.getFavoriteIDArray();
   loaded = false;
    update();
  }

}