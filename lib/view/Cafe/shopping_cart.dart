import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/dimensions.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
        elevation: 0,
        leading: IconButton(onPressed: (){AppRoute.pop();}, icon: Icon(Icons.arrow_back_ios,color: ColorsApp().primary,)),
        title: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 25)),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Text('My Order', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          Expanded(
              flex: 20,
              child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 7),
                      blurRadius: 7,
                    )
                  ],
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/latte.png',width: Dimensions.height30*3,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          const Text('Cappuccino',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(width: Dimensions.height30*5,child: Text('Lorem Ipsum is simply ... ',style: TextStyle(color: ColorsApp().greyIcon,fontSize: 12,fontWeight: FontWeight.bold),maxLines: 1,)),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: ColorsApp().primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(FontAwesomeIcons.minus,color: Colors.white,size: 15,),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text('1',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),),
                              const SizedBox(width: 10,),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: ColorsApp().primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(FontAwesomeIcons.plus,color: Colors.white,size: 15,),
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                      Text('40 LE',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),

                    ],
                  ),
                );
              })),
          Container(
            width: Dimensions.screenWidth,
            height: Dimensions.height30*6,
            color: ColorsApp().primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total:', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                        Text('40 LE',style: GoogleFonts.oleoScript(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      AppRoute.push(const ShoppingCart(),name: 'Shopping Cart');
                    },
                    child: Container(
                      height: Dimensions.height30*1.8,
                      margin:  EdgeInsets.all( Dimensions.height30),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const[
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 7),
                            blurRadius: 7,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Checkout',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
