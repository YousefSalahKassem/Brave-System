import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/text_field.dart';
import '../../constants/color.dart';
import '../../constants/dimensions.dart';
import '../../utils/routes.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name= TextEditingController();
    TextEditingController email= TextEditingController();
    TextEditingController phone= TextEditingController();

    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar:AppBar(
        title: Text('Edit Information',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
        elevation: 0,
        leading: IconButton(onPressed: (){AppRoute.pop();}, icon: Icon(Icons.arrow_back_ios,color: ColorsApp().primary,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height20,),
          Center(
            child: Stack(
              children: [
                Container(
                  height: Dimensions.height30*4,
                  width: Dimensions.height30*4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.splashImage),
                      image: const DecorationImage(image: AssetImage('assets/images/fifa.jpg',),fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsApp().secondaryDark.withOpacity(.5),
                          offset: const Offset(0, 7),
                          blurRadius: 7,
                        )
                      ]
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorsApp().primary,
                      child: const Icon(FontAwesomeIcons.camera,color: Colors.white,size: 20,),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height20,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //email
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Email', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                ),
                SizedBox(height: Dimensions.height10/5,),
                TextFieldApp(controller: email,hint: "Email",icon: const Icon(Icons.email),textInputType: TextInputType.emailAddress,isPassword: false,),
                SizedBox(height: Dimensions.height30,),

                //name
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Name', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                ),
                SizedBox(height: Dimensions.height10/5,),
                TextFieldApp(controller: name,hint: "Name",icon: const Icon(Icons.person),textInputType: TextInputType.name,isPassword: false,),
                SizedBox(height: Dimensions.height30,),

                //phone
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Phone', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                ),
                SizedBox(height: Dimensions.height10/5,),
                TextFieldApp(controller: phone,hint: "Phone",icon: const Icon(Icons.phone),textInputType: TextInputType.phone,isPassword: false,),
                SizedBox(height: Dimensions.height30,),

                //save
                Container(
                  margin: const EdgeInsets.all(15) ,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorsApp().primary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Text(
                      'Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
