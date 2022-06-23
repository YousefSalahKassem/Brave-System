import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../constants/dimensions.dart';
import '../../controller/rooms_controller.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      body: Stack(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/news.jpg',width: double.infinity,height: Dimensions.splashImage*1.3,fit: BoxFit.cover,),
              Positioned(
                bottom: Dimensions.height30*2.5,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.height30*2),
                  ),
                  child: Icon(FontAwesomeIcons.solidHeart,color: ColorsApp().primary,),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.splashImage*2.3,
              decoration: BoxDecoration(
                  color:Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.height30*2))
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.height30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lorem Ipsum is simply dummy text of the printing.', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                    const SizedBox(height: 10,),
                    Text('Brave Cafe', style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.bold,fontSize: 14),),
                    Text('Dec 22, 2022', style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w700,fontSize: 14),),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w500),),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
