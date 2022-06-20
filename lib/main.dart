import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/onBaording/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'constants/globals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Brave Cafe',
      theme: ColorsApp().lightTheme,
      darkTheme: ColorsApp().darkTheme,
      navigatorKey: Globals.instance.navigatorKey,
      onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
      debugShowCheckedModeBanner: false,
      themeMode: ColorsApp().isDarkMode==true? ThemeMode.light : ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}






