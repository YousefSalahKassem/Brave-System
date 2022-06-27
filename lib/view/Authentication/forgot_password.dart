import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../components/text_field.dart';
import '../../controller/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  final formKey= GlobalKey<FormState>();

  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return GetBuilder<AuthController>(
      builder: (controller){
        return Scaffold(
          backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
          appBar: AppBar(
            backgroundColor: ColorsApp().secondaryLight,
            elevation: 0,
            title: Text('Forgot Password',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),),
            leading: IconButton(onPressed: (){AppRoute.pop();}, icon: Icon(Icons.arrow_back_ios,color: ColorsApp().primary,)),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //picture
              SvgPicture.asset('assets/images/forgot.svg',width: Dimensions.splashImage,),
              SizedBox(height: Dimensions.height10,),

              //cardInfo
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
                    TextFieldApp(controller: controller.email,hint: "Email",icon: const Icon(Icons.email),textInputType: TextInputType.emailAddress,isPassword: false, validation: 'Email is empty, please enter your email'),
                    SizedBox(height: Dimensions.height20,),

                    InkWell(
                      onTap: (){
                        if(formKey.currentState!.validate()) {
                          controller.resetPassword(controller.email.text);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: ColorsApp().primary,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text(
                            'Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),

                  ],
                ),
              ),
              SizedBox(height: Dimensions.height30,),

              //check mail text
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height30*3),
                child: Text('Check your mail to reset your password again !\nThen login again with new password.',textAlign: TextAlign.center,style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        );
      },
    );
  }
}
