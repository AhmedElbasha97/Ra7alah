
import 'package:get/get.dart';
import 'package:ra7alah/screens/FavoriteScreens/favorite_screen.dart';
import 'package:ra7alah/screens/HomeScreen/home_screen.dart';
import 'package:ra7alah/screens/ProfileScreen/profile_screen.dart';
import 'package:ra7alah/screens/StartScreen/start_screen.dart';
import 'package:ra7alah/screens/intro/intro_screen.dart';
import 'package:ra7alah/widgets/offline_page.dart';





mixin AppRoutes {
  static String initialRoute = "/intro";
  static String notConnected = "/widgets";
  static String homeScreen = "/HomeScreen";
  static String startPage = "/StartScreen";
  static String favScreen = "/FavoriteScreens";
  static String profScreen = "/ProfileScreen";


  static List<GetPage> routes = [
    // GetPage(name: initialRoute, page: () => PersonalInformationScreen()),
    GetPage(name: initialRoute, page: () => const Intro()),
    GetPage(name: notConnected, page: () => const OfflinePage()),
    GetPage(name: startPage, page: () => const StartScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: favScreen, page: () => const FavoriteScreen()),
    GetPage(name: profScreen, page: () => const ProfileScreen()),


  ];
}
