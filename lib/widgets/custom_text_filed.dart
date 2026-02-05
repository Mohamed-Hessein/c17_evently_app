
import 'package:flutter/material.dart';

import '../core/stylesApp.dart';

class CustomTextFeild extends StatefulWidget {
  CustomTextFeild({

    super.key,required this.image,required this.hintText,required this.isPass,required this.controller, required this.valdaitor
  });
  bool isClick  = false;
  String image ;
  String hintText;
  bool isPass ;
  TextEditingController controller;
  String? Function(String?) valdaitor;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isClick,
      validator:
        widget.valdaitor,

      controller: widget.controller,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          prefixIcon: widget.isPass ?Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
               widget. isClick = !widget.isClick;
               setState(() {

               });

              },
                child: widget.isClick ?  Image.asset('assets/images/eye-slash.png',width: 24,height: 24,):Icon(color: Colors.grey,Icons.visibility,size: 24,)),
          ): SizedBox.shrink() ,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.image,height: 24,width: 24,),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          hintText: widget.hintText,
          hintStyle: StylesApp.style14Bold,
          border: InputBorder.none

      ),

    );
  }
}
