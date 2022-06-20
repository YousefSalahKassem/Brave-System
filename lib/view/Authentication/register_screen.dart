import 'package:bravesystem/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../components/text_field.dart';
import '../../constants/color.dart';
import '../../constants/dimensions.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email= TextEditingController();
    TextEditingController password= TextEditingController();
    TextEditingController phone= TextEditingController();
    TextEditingController name= TextEditingController();
    return Scaffold(
      backgroundColor: ColorsApp().primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0,top: Dimensions.height30*6),
            child: const Text('Sign Up', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
          ),

          SizedBox(height: Dimensions.height20,),

          Expanded(
            child: Container(
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                  color: Get.isDarkMode?Colors.black54:ColorsApp().secondaryLight,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,right: 20,top: Dimensions.height30,bottom: Dimensions.height20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: Dimensions.height10/5,),
                    const Text('Hello !. Sign Up to continue!', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 12),),
                    SizedBox(height: Dimensions.height30,),

                    //name
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text('Name', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                    SizedBox(height: Dimensions.height10/5,),
                    TextFieldApp(controller: name,hint: "Name",icon: const Icon(Icons.person),textInputType: TextInputType.name,isPassword: false,),
                    SizedBox(height: Dimensions.height10,),


                    //phone
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text('Phone', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                    SizedBox(height: Dimensions.height10/5,),
                    TextFieldApp(controller: phone,hint: "Phone",icon: const Icon(Icons.phone),textInputType: TextInputType.phone,isPassword: false,),
                    SizedBox(height: Dimensions.height10,),


                    //email
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text('Email', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                    SizedBox(height: Dimensions.height10/5,),
                    TextFieldApp(controller: email,hint: "Email",icon: const Icon(Icons.email),textInputType: TextInputType.emailAddress,isPassword: false,),
                    SizedBox(height: Dimensions.height10,),


                    //password
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text('Password', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                    SizedBox(height: Dimensions.height10/5,),
                    TextFieldApp(controller: password,hint: "Password",icon: const Icon(Icons.lock),textInputType: TextInputType.text,isPassword: true,),
                    SizedBox(height: Dimensions.height20*1.5,),

                    //register
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: ColorsApp().primary,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text(
                          'Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                      ),
                    ),

                    SizedBox(height: Dimensions.height20,),

                    //switch mode light and dark
                    InkWell(
                      onTap: (){
                        AppRoute.pop();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already Have an account?',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'SignIn', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
