import 'package:bravesystem/constants/color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(10),
          color: ColorsApp().primary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}