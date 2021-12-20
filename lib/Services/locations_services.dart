import 'package:ra7alah/models/location_model.dart';
import 'package:ra7alah/utils/services/api_service.dart';

class LocationService {
  static ApiService api = ApiService();
  static Future<List<Location>?> getCategories() async {
    var data = await api.request("/govrnments.json", "GET");
    if (data != null) {
      List<Location> citys = [];
      print(data);
      data.forEach((element) {
        citys.add(Location.fromJson(element));
      });
      return citys;
    }

  }
}