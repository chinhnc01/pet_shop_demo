import 'package:get/get.dart';
import 'package:pet_shop/modules/dashboard/dashboard_screen.dart';
import 'package:pet_shop/modules/home/home_binding.dart';
import 'package:pet_shop/modules/home/home_screen.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_binding.dart';
import 'package:pet_shop/modules/pet_detail/pet_detail_screen.dart';
import 'package:pet_shop/modules/splash/splash_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
    binding: HomeBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: DashboardScreen.routeName,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: PetDetailScreen.routeName,
    page: () => const PetDetailScreen(),
    binding: PetDetailBinding(),
    transition: Transition.fade,
  ),
];
