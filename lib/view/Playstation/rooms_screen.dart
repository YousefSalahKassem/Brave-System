import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/rooms_controller.dart';
import 'package:bravesystem/model/ServiceModel/category_model.dart';
import 'package:bravesystem/model/ServiceModel/room_model.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Playstation/room_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items =['Hii','Bye'];
    TextEditingController controller= TextEditingController();
    Get.put(RoomsController());


    return Scaffold(
      backgroundColor: ColorsApp().primary,
      appBar:AppBar(
        title: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        backgroundColor: ColorsApp().primary,
        elevation: 0,
        actions: [Container(
          margin: const EdgeInsets.all(8),
          width: Dimensions.height30*1.4,
          height: Dimensions.height30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage('assets/images/fifa.jpg'),fit: BoxFit.cover)
          ),
        )],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.height30,
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Hello, Yousef Salah', style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Enjoy your second\nHome.', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          
          SizedBox(height: Dimensions.height30,),
          
          Expanded(child: Container(
            width: Dimensions.screenWidth,
            height: Dimensions.screenHeight,
            decoration: BoxDecoration(
              color: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.height30*2))
            ),
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height30*1.5,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Recently Popular', style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                            Text('Top Rated', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height30*1.5,
                          width: Dimensions.height30*4,
                          child: CustomDropdown(
                            selectedStyle: TextStyle(color: ColorsApp().primary),
                            hintStyle: TextStyle(color: ColorsApp().primary),
                            items: items,
                            controller: controller,
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: ColorsApp().primary,width: 3),
                            onChanged: (value){
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: Dimensions.height20,),

                  GetBuilder<RoomsController>(
                    builder: (controller){
                      return CarouselSlider.builder(
                          itemCount: rooms.length,
                          itemBuilder: (context,index,_){
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
                                      width: Dimensions.width30*18,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: Dimensions.height30*5.5,
                                            width: Dimensions.width30*18,
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
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                        child: Row(
                                                          children: [
                                                            const Icon(FontAwesomeIcons.peopleGroup,color: Colors.white,size: 15,),
                                                            SizedBox(width: Dimensions.height10,),
                                                            const Text('3-5 Players', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                                                          ],),
                                                      ),
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
                                        right: 0,
                                        child: Image.asset('assets/images/playstation5.png'))

                                  ],
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              height: Dimensions.height30*8.5,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: .7,
                              onPageChanged: (i,_){
                                controller.changeTabIndex(i);
                              }
                          ));
                    },
                  ),

                  GetBuilder<RoomsController>(
                    builder: (controller){
                      return Center(
                        child: DotsIndicator(
                          dotsCount: rooms.length,
                          position: controller.roomIndex.toDouble(),
                          decorator: DotsDecorator(
                            activeColor: ColorsApp().primary,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Dimensions.height30,),
                  
                  SizedBox(
                    height: Dimensions.height30*2,
                    width: Dimensions.screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: Dimensions.height30*1.5,
                            width: Dimensions.height30*4,
                            decoration: BoxDecoration(
                              color: ColorsApp().blueLight,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                    width: Dimensions.height30*2,
                                    height: Dimensions.screenHeight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(image: AssetImage('assets/images/ps4.png',),fit: BoxFit.cover,)
                                    )),
                                SizedBox(width: Dimensions.height10,),
                                const Text('Ps4',style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
