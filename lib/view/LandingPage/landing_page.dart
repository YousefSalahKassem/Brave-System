import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/bottomNav_controller.dart';
import 'package:bravesystem/view/Cafe/menu_screen.dart';
import 'package:bravesystem/view/Playstation/rooms_screen.dart';
import 'package:bravesystem/view/Profile/profile_screen.dart';
import 'package:bravesystem/view/Spinner/spinner_screen.dart';
import 'package:bravesystem/view/Tournamets/tournamets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());

    return GetBuilder<BottomNavController>(
      builder: (controller){
        return Scaffold(
          backgroundColor: ColorsApp().primary,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const[
                SpinnerScreen(),
                MenuScreen(),
                RoomsScreen(),
                TournametScreen(),
                ProfileScreen()
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              selectedItemColor: ColorsApp().primary,
              unselectedItemColor: ColorsApp().greyIcon,
              backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
              elevation: 0,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gift),
                  label: ''
                ),
                const BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.mugSaucer),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      width: Dimensions.height30*1.5,
                      height: Dimensions.height30*1.5,
                      padding: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: ColorsApp().secondaryLight,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          controller.tabIndex==2?BoxShadow(
                            color: ColorsApp().primary.withOpacity(.5),
                            offset: const Offset(0, 7),
                            blurRadius: 7,
                          ):const BoxShadow()
                        ],
                        border: Border.all(color: controller.tabIndex==2?ColorsApp().primary.withOpacity(.7):ColorsApp().greyIcon,width: 4),
                      ),
                      child: Center(child: SvgPicture.asset('assets/icons/playstation.svg',color: controller.tabIndex==2?ColorsApp().primary:ColorsApp().greyIcon,)),
                    ),
                    label: ''
                ),
                const BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.medal),
                    label: ''
                ),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: ''
                ),
              ]),
        );
      },
    );
  }
}
