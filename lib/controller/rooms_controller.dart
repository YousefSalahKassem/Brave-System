import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import '../components/text_field.dart';
import '../constants/color.dart';
import '../constants/dimensions.dart';

class RoomsController extends GetxController{
  var roomIndex=0;
  RxList <String> images = ['assets/images/room1.jpg','assets/images/room2.jpg','assets/images/room3.jpg','assets/images/room4.jpg','assets/images/room5.jpg'].obs;
  TextEditingController promoCode=TextEditingController();
  TimeOfDay time = TimeOfDay.now();


  void changeTabIndex(int index){
    roomIndex=index;
    update();
  }

  void pickTime(TimeOfDay value){
    time=value;
    print(time.hour);
    update();
  }

  bookRoom(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: Dimensions.splashImage*1.7,
            padding: EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.height30),
            child: Column(
              children: [
                Text('Room 1', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                SizedBox(height: Dimensions.height30,),

                StatefulBuilder(
                  builder: (BuildContext context,StateSetter setState){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(time.format(context).toString(),style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18)),
                        InkWell(
                          onTap: (){
                            setState((){
                              Navigator.of(context).push(
                                showPicker(
                                    context: context,
                                    value: time,
                                    onChange: (value){
                                      setState((){
                                        time=value;
                                      });
                                    }
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: ColorsApp().primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const
                            Center(child: Text('Pick',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                          ),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: Dimensions.height20,),

                TextFormField(
                  controller: promoCode,
                  style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Promo Code..",
                      prefixIcon: const Icon(FontAwesomeIcons.gift),
                      hintStyle: TextStyle(color: ColorsApp().greyIcon)
                  ),
                ),
                SizedBox(height: Dimensions.height20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Percentage:', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22),),
                    Text('40 LE',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
                  ],
                ),
                const SizedBox(height: 20,),

                Container(
                  margin: const EdgeInsets.all(15) ,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorsApp().primary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Text(
                      'Book Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}