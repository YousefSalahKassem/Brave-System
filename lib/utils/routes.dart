import 'package:bravesystem/view/Authentication/forgot_password.dart';
import 'package:bravesystem/view/Authentication/login_screen.dart';
import 'package:bravesystem/view/Authentication/register_screen.dart';
import 'package:bravesystem/view/Cafe/menu_screen.dart';
import 'package:bravesystem/view/LandingPage/landing_page.dart';
import 'package:bravesystem/view/Playstation/room_details.dart';
import 'package:bravesystem/view/Playstation/rooms_screen.dart';
import 'package:bravesystem/view/Spinner/spinner_screen.dart';
import 'package:bravesystem/view/Tournamets/tournamets_screen.dart';
import 'package:bravesystem/view/onBaording/on_baording_screen.dart';
import 'package:flutter/cupertino.dart';

import '../constants/globals.dart';

class AppRoute{
  static const String home ='/';
  static const String onBoard='/onBoard';
  static const String login='/login';
  static const String signUp='/signUp';
  static const String forgot='/forgot';
  static const String spinner='/spinner';
  static const String cafe='/cafe';
  static const String playstation='/playstation';
  static const String prize='/prize';
  static const String profile='/profile';
  static const String roomDetails='/roomDetails';


  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings){
    Widget _getPage(String? name){
      switch (name){
        case login: return const LoginScreen();

        case signUp: return const RegisterScreen();

        case forgot: return const ForgotPassword();

        case cafe: return const MenuScreen();

        case spinner: return const SpinnerScreen();

        case playstation: return const RoomsScreen();

        case prize: return const TournametScreen();

        case profile: return const TournametScreen();

        case home: return const LandingPage();

        case roomDetails: return const RoomDetails();

        default: return const OnBoardingScreen();
      }
    }
    return CupertinoPageRoute(settings: routeSettings,builder: (context) => _getPage(routeSettings.name));
  }

  static Route<T> getRoute<T>(Widget widget, [String? name]) {
    return CupertinoPageRoute(
          settings: RouteSettings(name: name), builder: (context) => widget);
  }


  static Future<T?>? push<T extends Object?>(Widget page, {String? name}) =>
      Globals.instance.navigatorKey.currentState?.push<T>(getRoute(page, name));

  static Future<T?>? pushReplacement<T extends Object?, TO extends Object>(
      Widget page,
      {String? name,
        TO? result}) =>
      Globals.instance.navigatorKey.currentState
          ?.pushReplacement<T, TO>(getRoute(page, name), result: result);

  static Future<T?>? pushNamed<T extends Object?>(String page) =>
      Globals.instance.navigatorKey.currentState?.pushNamed<T>(page);

  static void pop<T extends Object?>() =>
      Globals.instance.navigatorKey.currentState?.pop<T>();

}