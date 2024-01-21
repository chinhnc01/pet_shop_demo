import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_shop/c_theme/c_theme.dart';
import 'package:pet_shop/modules/auth/login/login_screen.dart';
import 'package:pet_shop/modules/routers.dart';
// import 'package:pet_shop/modules/splash/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: SThemeTask.lightTheme,
      darkTheme: SThemeTask.darkTheme,
      themeMode: ThemeService().theme,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.fadeIn,
      // initialRoute: SplashScreen.routeName,
      // initialRoute: HomeScreen.routeName,
      initialRoute: LoginScreen.routeName,
    );
  }
}
