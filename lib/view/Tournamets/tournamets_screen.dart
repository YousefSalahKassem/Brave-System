import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/view/Tournamets/game_details.dart';
import 'package:bravesystem/view/Tournamets/news_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/dimensions.dart';
import '../../controller/rooms_controller.dart';
import '../../model/ServiceModel/category_model.dart';
import '../../model/ServiceModel/room_model.dart';
import '../../utils/routes.dart';
import '../Playstation/room_details.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Games',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: ColorsApp().primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.search,color: Colors.white,),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.height20),
              height: Dimensions.height30*2,
              width: Dimensions.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      AppRoute.push(const GameDetails(),name:'gameDetails');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('',),
                      ),
                    ),
                  );
                },
              ),
            ),

            //matches
            Padding(
              padding: EdgeInsets.only(left: 15.0,top: Dimensions.height15),
              child: Text('Today\'s Matches', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
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

            //news
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('News', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
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
                      return InkWell(
                        onTap: (){
                          AppRoute.push(const NewsDetails(),name: 'News Details');
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              alignment: Alignment.center,
                              height: Dimensions.height30*7.6,
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
                                children: [
                                  Container(
                                    height: Dimensions.height30*4,
                                    width: Dimensions.screenWidth,
                                    decoration: BoxDecoration(
                                      color: ColorsApp().blueTransparent,
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                      image: const DecorationImage(image: AssetImage('assets/images/news.jpg'),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Lorem Ipsum is simply dummy text of the printing.', maxLines: 2 ,style: TextStyle(color: ColorsApp().secondaryLight,fontWeight: FontWeight.w500,fontSize: 16),),
                                  ),
                                  const Spacer(),
                                  Align(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: Dimensions.height30*10,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: .7,
                    ));
              },
            ),

          ],
        ),
      ),
    );
  }
}
