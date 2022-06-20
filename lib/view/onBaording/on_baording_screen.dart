import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Authentication/login_screen.dart';
import 'package:bravesystem/view/onBaording/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IntroductionScreen(
      pages: [

        PageViewModel(
          title: 'Playstation',
          body: 'Enjoy your time with us ❤️,\nBook your room now and enjoy with your friends !',
          image: SvgPicture.asset('assets/images/gaming.svg',width: Dimensions.splashImage*1.5,),
          decoration: getPageDecoration(),

    ),

        PageViewModel(
            title: 'Cafe',
            body: 'Enjoy your coffee ❤️,\nOrder your coffee while playing with your friends !',
            image: SvgPicture.asset('assets/images/coffe.svg',width: Dimensions.splashImage*1.5,),
            decoration: getPageDecoration(),

        ),

        PageViewModel(
            title: 'Brave Cafe',
            body: 'Enjoy your time in your\nsecond home ❤️',
            image: Image.asset('assets/images/logo2.png',width: Dimensions.splashImage*1.5,),
            decoration: getPageDecoration(),
            footer: ButtonWidget(
            text: 'Explore Now',
            onClicked: () => goToLogin(context),

          ),
        ),

      ],
      done: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToLogin(context),
      showSkipButton: true,
      skip: const Text('Skip'),
      onSkip: () => goToLogin(context),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),

    )
    );
  }

  void goToLogin(context){
    AppRoute.pushReplacement(const LoginScreen(),name: 'login' );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: const Color(0xFFBDBDBD),
    activeColor: ColorsApp().primary,
    size: const Size(10, 10),
    activeSize: const Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: ColorsApp().primary),
    bodyTextStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
    contentMargin: const EdgeInsets.all(16).copyWith(bottom: 0),
    footerPadding: EdgeInsets.only(top: Dimensions.height30*2),
    imagePadding: const EdgeInsets.all(24),
    pageColor: Colors.white,
  );

}
