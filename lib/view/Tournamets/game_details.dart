import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/model/ServiceModel/knockout_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/rooms_controller.dart';
import '../../model/ServiceModel/room_model.dart';

class GameDetails extends StatelessWidget {

  const GameDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items =['Hii','Bye'];
    TextEditingController controller= TextEditingController();
    Get.put(RoomsController());

    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Fifa 22', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                          width: Dimensions.height30*8,
                          child: Text('When you are a starting Real Madrid player,you have to think big. Think of the Ballon d\'Or.',style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 12),)),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/ps5.jpg',),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 15.0,top: 8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text('see more..', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.w500,fontSize: 14),),
            ),
          ),
          GetBuilder<RoomsController>(
            builder: (controller){
              return CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context,index,_){
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          height: Dimensions.height30*8,
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
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: Dimensions.height30*1.5,
                                    width: Dimensions.screenWidth,
                                    decoration: BoxDecoration(
                                        color: ColorsApp().blueTransparent,
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Dimensions.height15),
                                    child: const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Semi Final', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),

                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:  const [
                                        CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/ps5.jpg'),
                                          radius: 30,
                                        ),
                                        Text('Fighters', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                      ],
                                    ),
                                    Text('vs', style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 12),),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:  const [
                                        CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/ps5.jpg'),
                                          radius: 30,
                                        ),
                                        Text('Fighters', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                      ],
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
                                  Padding(
                                    padding: EdgeInsets.all(Dimensions.height15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Fifa 22', style: TextStyle(color: Colors.white.withOpacity(.5),fontWeight: FontWeight.bold,fontSize: 16),),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text('Live', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),

                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: Dimensions.height30*11,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: .7,
                  ));
            },
          ),
          const Spacer(),
          Container(
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              color: ColorsApp().primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: ColorsApp().primary,
                  offset: const Offset(7, 0),
                  blurRadius: 10,
                )
              ]
            ),
            child: Column(
              children: [
                const SizedBox(height: 8,),
                Container(
                  height: 3,
                  margin: const EdgeInsets.only(top: 10),
                  width: Dimensions.height30*2,
                  color: ColorsApp().borderColor,
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: Dimensions.height30*1.5,
                    width: Dimensions.height30*4,
                    child: CustomDropdown(
                      selectedStyle: const TextStyle(color: Colors.white),
                      fillColor: ColorsApp().primary,
                      hintStyle: const TextStyle(color: Colors.white),
                      items: items,
                      controller: controller,
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: ColorsApp().primary,width: 3),
                      onChanged: (value){
                      },
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: Dimensions.splashImage*1.12,
                    child: ListView.builder(
                      itemCount: knockOuts.length,
                      itemBuilder: (context,index){
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.height30),
                            color: ColorsApp().blueTransparent,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex:4,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundImage: AssetImage('assets/images/team1.png'),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(knockOuts[index].hostName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                        ],
                                      ),
                                    ),
                                     Divider(
                                      color: ColorsApp().primary,
                                      thickness: 3,
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundImage: AssetImage('assets/images/team1.png'),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(knockOuts[index].hostName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height30*4,
                                child: Container(
                                  width: 3,
                                  color: ColorsApp().primary,
                                ),
                              ),
                              Expanded(
                                flex:1,
                                child: Column(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: ColorsApp().blueKnockOut,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.height30))
                                        ),
                                        height: Dimensions.height30*2,
                                        width:Dimensions.splashImage*1.5,
                                        child: Center(child: Text(knockOuts[index].hostScore,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                                    Divider(
                                      color: ColorsApp().primary,
                                      thickness: 3,
                                      height: 3,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height30*2,
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(knockOuts[index].hostScore,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
