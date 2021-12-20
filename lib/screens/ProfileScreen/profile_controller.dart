import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ra7alah/Services/auth_services.dart';
import 'package:ra7alah/models/user.dart';


class ProfileController extends GetxController{
  late Users user ;
  var loaded = false;
  final AuthService sinning =  AuthService(FirebaseAuth.instance);
  @override
  void onInit() {
    setUpDate();
    super.onInit();
  }
  setUpDate() async {
    loaded = true;
   user = await sinning.getDataOfCurrentUser();
   loaded  = false;
   update();
  }
  signingOut(){
    sinning.signOut();
  }
}