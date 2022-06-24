import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/spinner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinnerScreen extends StatelessWidget {
  const SpinnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SpinnerController());
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar:AppBar(
        title: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<SpinnerController>(
        builder: (controller){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.splashImage,
                  width: Dimensions.splashImage,
                  child: FortuneWheel(
                      animateFirst: false,
                      selected: controller.selected.stream,
                      indicators: const <FortuneIndicator>[
                        FortuneIndicator(
                          alignment: Alignment.topCenter, // <-- changing the position of the indicator
                          child: TriangleIndicator(
                            color: Colors.orange, // <-- changing the color of the indicator
                          ),
                        ),
                      ],
                      onAnimationEnd: (){
                        controller.result();
                        controller.flag=true;
                      },
                      items: [
                        for (var it in controller.offers)
                        FortuneItem(
                            child: Text(it)
                        ),
                      ]),
                ),
                SizedBox(height: Dimensions.height30,),
                Container(
                  width: Dimensions.height30*5,
                  padding: const EdgeInsets.all(15),
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
                  child: InkWell(
                    onTap: (){
                      controller.startGame();
                    },
                    child: const Center(
                      child: Text(
                        'Play Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height30,),
                controller.flag==false?Container():Text('Enjoy you offer with ${controller.offers[controller.offer]}',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
