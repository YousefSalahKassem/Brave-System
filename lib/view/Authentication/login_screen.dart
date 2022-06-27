import 'package:bravesystem/components/text_field.dart';
import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/auth_controller.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Authentication/forgot_password.dart';
import 'package:bravesystem/view/Authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(AuthController());
    return GetBuilder<AuthController>(
      builder: (controller){
        return Scaffold(
          backgroundColor: ColorsApp().primary,
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0,top: Dimensions.height30*6),
                      child: const Text('Sign In', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                    ),

                    SizedBox(height: Dimensions.height30,),

                    Expanded(
                      child: Container(
                        width: Dimensions.screenWidth,
                        decoration:  BoxDecoration(
                            color: Get.isDarkMode?Colors.black54:ColorsApp().secondaryLight,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20,top: Dimensions.height30,bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome Back', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),),
                              SizedBox(height: Dimensions.height10/5,),
                              const Text('Hello !. Sign in to continue!', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 12),),
                              SizedBox(height: Dimensions.height30,),

                              //email
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text('Email', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                              ),
                              SizedBox(height: Dimensions.height10/5,),
                              TextFieldApp(controller: controller.email,hint: "Email",icon: const Icon(Icons.email),textInputType: TextInputType.emailAddress,isPassword: false, validation: 'Email is empty, please enter your email',),
                              SizedBox(height: Dimensions.height20,),

                              //password
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text('Password', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                              ),
                              SizedBox(height: Dimensions.height10/5,),
                              TextFieldApp(controller: controller.password,hint: "Password",icon: const Icon(Icons.lock),textInputType: TextInputType.text,isPassword: true, validation: 'password is empty, please enter your password'),
                              SizedBox(height: Dimensions.height20,),

                              //forgot password
                              InkWell(
                                onTap: (){AppRoute.push(ForgotPassword(),name:'forgotPassword');},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Align(alignment: Alignment.bottomRight,child: Text('Forgot Password ?', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),)),
                                ),
                              ),

                              //Login
                              SizedBox(height: Dimensions.height20*1.5,),
                              controller.isLoadingSignIn
                                  ? Center(
                                    child: CircularProgressIndicator(
                                color: ColorsApp().primary,
                              ),
                                  )
                                  :InkWell(
                                onTap: (){
                                  if(formKey.currentState!.validate()) {
                                    controller.signInWithEmailAndPassword();
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
                              SizedBox(height: Dimensions.height30,),

                              const Align(alignment: Alignment.center,child: Text('Or connected with', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 12),)),
                              SizedBox(height: Dimensions.height20,),

                              //google and facebook
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child:  controller.isLoadingSignInWithGoogle
                                        ? CircularProgressIndicator(
                                      color: ColorsApp().primary,
                                    )
                                        :InkWell(
                                      onTap: (){
                                        controller.googleSignInMethod();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: ColorsApp().googleButton,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(FontAwesomeIcons.google,color: Colors.white,),
                                            Text(
                                              'Google',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrangeAccent,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(FontAwesomeIcons.phone,color: Colors.white,),
                                          Text(
                                            'Phone',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //register
                              SizedBox(height: Dimensions.height30,),
                              InkWell(
                                onTap: (){
                                  AppRoute.push(RegisterScreen(),name: 'register');
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'Don’t have an account?',
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: 'SignUp', style: TextStyle(fontWeight: FontWeight.bold)),
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
                Positioned(top: -Dimensions.height30,right:-Dimensions.height30,child: Align(alignment: Alignment.topRight,child: Image.asset('assets/images/circles.png',))),

              ],
            ),
          ),
        );
      },
    );
  }
}
