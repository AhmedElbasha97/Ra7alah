import 'package:get/get.dart';

import 'package:ra7alah/Services/favorite_services.dart';
import 'package:ra7alah/models/fav_model.dart';

class favoriteScreenController extends GetxController{

  final FavoriteServices fav =  FavoriteServices();
  var loading = false;
  var noDataToShow = false;


  List<Favorite> favs= [];
  List<String> ids= [];

  @override
  Future<void> onInit() async {
    checkIfUserHaveFavoritesOrNot();
    super.onInit();
  }

  checkIfUserHaveFavoritesOrNot() async {
    var check = await fav.checkIfThereIsFavoritesToTHisUser();
    if(check!=null){
      getDataForFavoriteTable();
    }else{
      loading = false;
      noDataToShow = true;
      update();
    }
  }

  getDataForFavoriteTable() async {
    noDataToShow = false;
    loading = true;
   favs =  await fav.getFavoriteData();
   ids = fav.getFavoriteIDArray();
   loading = false;
    update();
  }

}