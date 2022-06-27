import 'package:bravesystem/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:awesome_widgets/awesome_widgets.dart';

class TextFieldApp extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Icon? icon;
  TextInputType? textInputType;
  bool isPassword;
  String validation;
  TextFieldApp({Key? key,this.icon,required this.controller,this.hint,this.textInputType,required this.isPassword,required this.validation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller!,
      style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold),
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: (value){
        if(value==null){
          return validation;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        hintStyle: TextStyle(color: ColorsApp().greyIcon)
      ),
    );
  }
}
