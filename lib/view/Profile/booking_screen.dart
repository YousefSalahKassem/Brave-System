import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/model/ServiceModel/room_model.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/dimensions.dart';
import '../Playstation/room_details.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar:AppBar(
        title: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
        elevation: 0,
        leading: IconButton(onPressed: (){AppRoute.pop();}, icon: Icon(Icons.arrow_back_ios,color: ColorsApp().primary,)),
      ),
      body: SizedBox(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child:  ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Today',
                    style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: rooms.length,
                      physics: const ClampingScrollPhysics(), // todo comment this out and check the result
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            AppRoute.push(const RoomDetails(),name: 'RoomDetails');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: Dimensions.height30*8,
                                  width: Dimensions.screenWidth,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: Dimensions.height30*6,
                                        margin: const EdgeInsets.symmetric(horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: ColorsApp().primary,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: const[
                                            BoxShadow(
                                              color: Colors.black45,
                                              offset: Offset(0, 7),
                                              blurRadius: 7,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            Padding(
                                              padding: EdgeInsets.only(top: Dimensions.height20,left: 15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Room ${index+1}', style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                                  const Text('Booked', style: TextStyle(color: Colors.green,fontWeight: FontWeight.normal,fontSize: 14),),
                                                  const Text('Dec 22, 2022', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                                                  const Text('3 Hours', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: Dimensions.height30*2,
                                                  width: Dimensions.screenWidth,
                                                  decoration: BoxDecoration(
                                                      color: ColorsApp().blueTransparent,
                                                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                                                      width: Dimensions.height30*4,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.only(
                                                              bottomRight: Radius.circular(15),
                                                              topLeft: Radius.circular(15)
                                                          )
                                                      ),
                                                      child: Center(
                                                        child: Text('Learn More', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 16),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    child: Padding(
                                                      padding: EdgeInsets.all(15.0),
                                                      child: Text('3:00 PM - 6:00 PM', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                                                    ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 10,
                                    child: Image.asset('assets/images/playstation5.png'))

                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          },
          itemCount: 9,
        ),

      ),
    );
  }
}
