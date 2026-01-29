import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/stylesApp.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,required this.text,required this.onPressed});
final String text;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(backgroundColor: AppColors.blueApp,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))
          , onPressed: onPressed, child: Center(child: Text(text, style: StylesApp.style20WhiteBold,))),
    );
  }
}
