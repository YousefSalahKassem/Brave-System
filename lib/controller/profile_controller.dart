import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController{

  changeMode(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: Dimensions.height30*5,
            padding: EdgeInsets.symmetric(vertical: Dimensions.height30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Get.changeTheme(ColorsApp().lightTheme);
                    AppRoute.pop();

                  },
                  child: Column(
                    children: [
                      Icon(FontAwesomeIcons.solidSun,color: ColorsApp().primary,size: 30,),
                      const SizedBox(height: 10,),
                      Text('Light Mode',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.changeTheme(ColorsApp().darkTheme);
                    AppRoute.pop();
                  },
                  child: Column(
                    children: [
                      Icon(FontAwesomeIcons.moon,color: ColorsApp().primary,size: 30,),
                      const SizedBox(height: 10,),
                      Text('Dark Mode',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  changeLanguage(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: Dimensions.height30*5,
            padding: EdgeInsets.symmetric(vertical: Dimensions.height30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ColorsApp().primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text('English',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ColorsApp().primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text('Arabic',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))
              ],
            ),
          );
        });
  }
}