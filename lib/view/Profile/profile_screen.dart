import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/auth_controller.dart';
import 'package:bravesystem/model/LocalModels/profile_model.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Cafe/shopping_cart.dart';
import 'package:bravesystem/view/Profile/booking_screen.dart';
import 'package:bravesystem/view/Profile/edit_profile.dart';
import 'package:bravesystem/view/Profile/order_history_screen.dart';
import 'package:bravesystem/view/Tournamets/tournamets_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: ColorsApp().primary,
      appBar: AppBar(
        backgroundColor: ColorsApp().primary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Dimensions.height30*4,
              width: Dimensions.height30*4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.splashImage),
                image: const DecorationImage(image: AssetImage('assets/images/fifa.jpg',),fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp().secondaryDark.withOpacity(.5),
                    offset: const Offset(0, 7),
                    blurRadius: 7,
                  )
                ]
              ),
            ),
          ),
          SizedBox(height: Dimensions.height15,),
          const Text(
            'Yousef Salah',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
          ),
          SizedBox(height: Dimensions.height10/2,),
          Text(
            'yousef.salah1@yahoo.com',style: TextStyle(color: Colors.white.withOpacity(.8),fontWeight: FontWeight.normal,fontSize: 16),
          ),
          SizedBox(height: Dimensions.height30,),
          Expanded(
            flex: 1,
            child:Container(
                  height: Dimensions.screenHeight,
                  width: Dimensions.screenWidth,
                  decoration:  BoxDecoration(
                      color: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Account', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: Dimensions.height10,),
                          Container(
                            height: Dimensions.height30*8,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode?Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: options.length,
                                itemBuilder: (context,index){
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(options[index].name,style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),),
                                        leading: Icon(options[index].icon,color: ColorsApp().primary,),
                                        onTap: (){
                                          if(index==0){
                                            AppRoute.push(const ShoppingCart(),name: 'Shopping Cart');
                                          }
                                          else if(index==1) {
                                            AppRoute.push(const BookingScreen(),name: 'Booking Screen');
                                          }
                                          else if(index==2) {
                                            AppRoute.push(const OrderHistory(),name: 'Order Screen');
                                          }
                                          else{
                                            AppRoute.push(const TournamentScreen(),name: 'Tournaments Screen');
                                          }
                                        },
                                      ),
                                      index==3?Container():Divider(color: ColorsApp().secondaryLight,height: 1,thickness: 2,)
                                    ],
                                  );
                                }),
                          ),

                          SizedBox(height: Dimensions.height20,),

                          Text('Settings', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: Dimensions.height10,),
                          GetBuilder<ProfileController>(
                            builder: (controller){
                              return Container(
                                height: Dimensions.height30*5.8,
                                decoration: BoxDecoration(
                                    color: Get.isDarkMode?Colors.black:Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: settings.length,
                                    itemBuilder: (context,index){
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(settings[index].name,style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),),
                                            leading: Icon(settings[index].icon,color: ColorsApp().primary,),
                                            onTap: (){
                                              if(index==0){
                                                AppRoute.push(const EditProfile(), name: 'Edit Profile');
                                              }
                                              else if (index ==1){
                                                controller.changeMode(context);
                                              }
                                              else{
                                                controller.changeLanguage(context);
                                              }
                                            },
                                          ),
                                          index==2?Container():Divider(color: ColorsApp().secondaryLight,height: 1,thickness: 2,)
                                        ],
                                      );
                                    }),
                              );
                            },
                          ),

                          SizedBox(height: Dimensions.height20,),

                          Text('Logout', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: Dimensions.height10,),
                      GetBuilder<AuthController>(
                        builder: (controller){
                          return Container(
                            decoration: BoxDecoration(
                                color: Get.isDarkMode?Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            child: ListTile(
                              title: const Text("Logout",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              leading: const Icon(Icons.logout,color: Colors.red,),
                              onTap: (){
                                controller.signOut();
                              },
                            ),
                          );
                        }
                      ),
                    ]),
                  ),
                )
    )
          )]
      )
    );
  }
}
