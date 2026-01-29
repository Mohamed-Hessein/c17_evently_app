import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/stylesApp.dart';
import '../widgets/lang_and_theme_button.dart';
import 'intoduction_screen.dart';

class LetsStartScreen extends StatefulWidget {
   LetsStartScreen({super.key});
static const routeName  = '/letsStart';

  @override
  State<LetsStartScreen> createState() => _LetsStartScreenState();
}

class _LetsStartScreenState extends State<LetsStartScreen> {
bool isCLick =  false;
bool isCLickTwo =  false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo_app_bar.png',width: 140,height: 30,),centerTitle: true,),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Image.asset('assets/images/lets_start.png'),

          Text('letsGoTitle',style: StylesApp.style20Bold,textAlign: TextAlign.start,).tr(),

   SizedBox(height: 8,)
        ,Text('letsGodesc',style: StylesApp.style16Bold,).tr(),SizedBox(height: 16,)

           , Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

             Text('language',style: StylesApp.style18BlueBold,).tr(),
                LangButton(title: 'English', secTitle: 'Arabic',),
             ],),

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          Text('Theme',style: StylesApp.style18BlueBold,).tr(),
            LangAndThemeButton(image: 'assets/images/sun.png',secImage: 'assets/images/moon.png',)
        ],)

          ,  SizedBox(height: 24,)
          ,
          SizedBox(
            height: 48,
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(backgroundColor: AppColors.blueApp,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))
               , onPressed: (){
                  Navigator.pushNamed(context,IntoductionScreenLite.routeName );

            }, child: Center(child: Text('letsGoBtn', style: StylesApp.style20WhiteBold,).tr())),
          )
          ],)),
      ),);
  }
}
