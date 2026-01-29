
import 'package:flutter/material.dart';

import '../core/stylesApp.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,required this.image,required this.hintText,required this.isPass,required this.controller, required this.valdaitor
  });
  String image ;
  String hintText;
  bool isPass ;
  TextEditingController controller;
  String? Function(String?) valdaitor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
        valdaitor,

      controller: controller,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          prefixIcon: isPass ?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/eye-slash.png',width: 24,height: 24,),
          ): SizedBox.shrink() ,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image,height: 24,width: 24,),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          hintText: hintText,
          hintStyle: StylesApp.style14Bold,
          border: InputBorder.none

      ),

    );
  }
}
