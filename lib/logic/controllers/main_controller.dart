
import 'package:book/views/screens/user/category_screen.dart';
import 'package:book/views/screens/user/favorites_screen.dart';
import 'package:book/views/screens/user/home_screen.dart';
import 'package:book/views/screens/admin/stock_screen.dart';
import 'package:book/views/screens/setting/profile.dart';
import 'package:book/views/screens/setting/settings_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ].obs;

  var title = [
    "Book Shop",
    'Favourites',
    "Profile",
  ].obs;
}