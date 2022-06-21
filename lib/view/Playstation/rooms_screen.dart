import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Text('Hello, Yousef Salah', style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          const SizedBox(height: 8,),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Enjoy your second\nHome.', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          
          SizedBox(height: Dimensions.height30,),
          
          Expanded(child: Container(
            height: Dimensions.screenHeight,
            decoration: BoxDecoration(
              color: ColorsApp().secondaryLight,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.height30*2))
            ),
          ))
        ],
      ),
    );
  }
}
