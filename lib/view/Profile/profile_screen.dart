import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/model/LocalModels/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().primary,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimensions.height30,),
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
            child:SingleChildScrollView(
              child: Container(
                    width: Dimensions.screenWidth,
                    decoration:  BoxDecoration(
                        color: Get.isDarkMode?Colors.black54:ColorsApp().secondaryLight,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                    ),
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
                                      ),
                                      index==3?Container():Divider(color: ColorsApp().secondaryLight,height: 1,thickness: 2,)
                                    ],
                                  );
                                }),
                          ),

                          SizedBox(height: Dimensions.height20,),

                          Text('Settings', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: Dimensions.height10,),
                          Container(
                            height: Dimensions.height30*8,
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
                                      ),
                                      index==3?Container():Divider(color: ColorsApp().secondaryLight,height: 1,thickness: 2,)
                                    ],
                                  );
                                }),
                          ),

                          SizedBox(height: Dimensions.height20,),

                          Text('Logout', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: Dimensions.height10,),
                          Container(
                            decoration: BoxDecoration(
                                color: Get.isDarkMode?Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            child: const ListTile(
                              title: Text("Logout",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              leading: Icon(Icons.logout,color: Colors.red,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            )
    )
        ]
      )
    );
  }
}
