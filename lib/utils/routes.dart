import 'package:bravesystem/view/Authentication/forgot_password.dart';
import 'package:bravesystem/view/Authentication/login_screen.dart';
import 'package:bravesystem/view/Authentication/register_screen.dart';
import 'package:bravesystem/view/Cafe/menu_screen.dart';
import 'package:bravesystem/view/Cafe/product_details.dart';
import 'package:bravesystem/view/Cafe/shopping_cart.dart';
import 'package:bravesystem/view/LandingPage/landing_page.dart';
import 'package:bravesystem/view/Playstation/room_details.dart';
import 'package:bravesystem/view/Playstation/rooms_screen.dart';
import 'package:bravesystem/view/Profile/booking_screen.dart';
import 'package:bravesystem/view/Profile/edit_profile.dart';
import 'package:bravesystem/view/Profile/order_details.dart';
import 'package:bravesystem/view/Profile/order_history_screen.dart';
import 'package:bravesystem/view/Profile/profile_screen.dart';
import 'package:bravesystem/view/Spinner/spinner_screen.dart';
import 'package:bravesystem/view/Tournamets/game_details.dart';
import 'package:bravesystem/view/Tournamets/news_details.dart';
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
  static const String newsDetails='/newsDetails';
  static const String gameDetails='/gameDetails';
  static const String tournaments='/tournaments';
  static const String productDetails='/productDetails';
  static const String shoppingCart='/shoppingCart';
  static const String bookingScreen='/bookingScreen';
  static const String orderHistory='/orderHistory';
  static const String orderDetails='/orderDetails';
  static const String editInformation='/editInformation';



  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings){
    Widget _getPage(String? name){
      switch (name){
        case login: return LoginScreen();

        case signUp: return RegisterScreen();

        case forgot: return ForgotPassword();

        case cafe: return const MenuScreen();

        case spinner: return const SpinnerScreen();

        case playstation: return const RoomsScreen();

        case prize: return const TournamentScreen();

        case profile: return const ProfileScreen();

        case home: return const LandingPage();

        case roomDetails: return RoomDetails();

        case tournaments: return const TournamentScreen();

        case newsDetails: return const NewsDetails();

        case gameDetails: return const GameDetails();

        case productDetails: return const ProductDetails();

        case shoppingCart: return const ShoppingCart();

        case bookingScreen: return const BookingScreen();

        case orderHistory: return const OrderHistory();

        case orderDetails: return const OrderDetails();

        case editInformation: return const EditProfile();

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