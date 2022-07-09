import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../../controller/rooms_controller.dart';
import '../../model/ServiceModel/room_model.dart';

class RoomDetails extends StatelessWidget {
  Room? room;
  RoomDetails({Key? key,this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      body: GetBuilder<RoomsController>(
        builder: (controller){
          return Stack(
            children: [
              Stack(
                children: [
                  GetBuilder<RoomsController>(
                    builder: (controller){
                      return CarouselSlider.builder(
                          itemCount: room!.images!.length,
                          itemBuilder: (context,index,_){
                            return Image.network(room!.images![index],width: double.infinity,height: Dimensions.splashImage*1.8,fit: BoxFit.fitHeight,);
                          },
                          options: CarouselOptions(
                              height: Dimensions.splashImage*1.8,
                              autoPlay: true,
                              viewportFraction: 1,
                              onPageChanged: (i,_){
                                controller.changeTabIndex(i);
                              }
                          ));
                    },
                  ),
                  Positioned(
                    bottom: Dimensions.height30*3,
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
                  height: Dimensions.splashImage*1.8,
                  decoration: BoxDecoration(
                      color:Get.isDarkMode?ColorsApp().dark:ColorsApp().secondaryLight,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.height30*2))
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.height30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(room!.name!, style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: ColorsApp().primary,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:  Center(child: Text(room!.rate!,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                            ),

                          ],),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(room!.description!,style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w500),),
                        ),

                        SizedBox(height: Dimensions.height30,),

                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: ColorsApp().blueLight,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: '${room!.price!} LE ',
                                          style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),
                                          children: <TextSpan>[
                                            TextSpan(text: '/ hours', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    controller.bookRoom(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: ColorsApp().primary,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const[
                                        BoxShadow(
                                          color: Colors.black45,
                                          offset: Offset(0, 7),
                                          blurRadius: 7,
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Book Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
