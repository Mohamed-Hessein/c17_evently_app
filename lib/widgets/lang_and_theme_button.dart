import 'package:easy_localization/easy_localization.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_colors.dart';
import '../core/stylesApp.dart';

class LangAndThemeButton extends StatefulWidget {

  final String image;

  final String secImage;
   LangAndThemeButton({super.key,required this.image, required this.secImage});

  @override
  State<LangAndThemeButton> createState() => _LangAndThemeButtonState();
}

class _LangAndThemeButtonState extends State<LangAndThemeButton> {
bool isCLick = false;

bool isCLickTwo = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [ElevatedButton(
          style: isCLick? ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueApp,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))):ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: (){
            provider.changTheme(ThemeMode.light);

            isCLick  = !isCLick;
            if(isCLick  == isCLickTwo){
              isCLickTwo = !isCLick;
            }
            setState(() {

            });
          }, child: isCLick? ImageIcon(AssetImage(widget.image),color: Colors.white,): ImageIcon(AssetImage(widget.image),color: AppColors.blueApp,)) , ElevatedButton(
          style: isCLickTwo? ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueApp,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))):ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: (){



            provider.changTheme(ThemeMode.dark);
            setState(() {
              isCLickTwo  = !isCLickTwo;    if(isCLick  == isCLickTwo){
                isCLick =!isCLickTwo;
              }

            });
          }, child: isCLickTwo? ImageIcon(AssetImage(widget.secImage),color: Colors.white,): ImageIcon(AssetImage(widget.secImage),color: AppColors.blueApp,)),],);
  }
}
class LangButton extends StatefulWidget {
  final String title;
  final String secTitle;
  const LangButton({super.key, required this.title, required this.secTitle});

  @override
  State<LangButton> createState() => _LangButtonState();
}

class _LangButtonState extends State<LangButton> {

  bool isCLick = false;

  bool isCLickTwo = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            style: isCLick? ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueApp,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))):ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: (){


              context.setLocale(Locale('ar', 'EG'));


              setState(() {
                isCLick  = !isCLick;
                if(isCLick  == isCLickTwo){
                  isCLickTwo = !isCLick;
                }
              });
            }, child: isCLick? Text(widget.title,style: StylesApp.style18BlueBold.copyWith(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400)):Text(widget.title,style: StylesApp.style18BlueBold.copyWith(fontSize: 14,fontWeight: FontWeight.w400),)),

    ElevatedButton(
    style: isCLickTwo? ElevatedButton.styleFrom(
    backgroundColor: AppColors.blueApp,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))):ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    onPressed: (){


      context.setLocale(Locale('en', 'US'));
    setState(() {
    isCLickTwo  = !isCLickTwo;    if(isCLick  == isCLickTwo){
    isCLick =!isCLickTwo;
    }

    });
    }, child: isCLickTwo? Text(widget.secTitle,style: StylesApp.style18BlueBold.copyWith(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400)):Text(widget.secTitle,style: StylesApp.style18BlueBold.copyWith(fontSize: 14,fontWeight: FontWeight.w400),))],
    );
  }
}
