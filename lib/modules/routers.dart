import 'package:get/get.dart';
import 'package:pet_shop/modules/account/account_binding.dart';
import 'package:pet_shop/modules/account/account_screen.dart';
import 'package:pet_shop/modules/all_pet/all_pet_binding.dart';
import 'package:pet_shop/modules/all_pet/all_pet_screen.dart';
import 'package:pet_shop/modules/auth/login/login_binding.dart';
import 'package:pet_shop/modules/auth/login/login_screen.dart';
import 'package:pet_shop/modules/auth/signup/signup_binding.dart';
import 'package:pet_shop/modules/auth/signup/signup_screen.dart';
import 'package:pet_shop/modules/cart/cart_binding.dart';
import 'package:pet_shop/modules/cart/cart_screen.dart';
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
  GetPage(
    name: AccountScreen.routeName,
    page: () => const AccountScreen(),
    binding: AccountBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: SignupScreen.routeName,
    page: () => const SignupScreen(),
    binding: SignupBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AllPetScreen.routeName,
    page: () => const AllPetScreen(),
    binding: AllPetBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: CartScreen.routeName,
    page: () => const CartScreen(),
    binding: CartBinding(),
    transition: Transition.fade,
  ),
];
