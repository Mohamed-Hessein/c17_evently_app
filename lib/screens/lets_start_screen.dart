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
<<<<<<< HEAD
    final isDark = Theme.of(context).brightness == Brightness.dark;
=======
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo_app_bar.png',width: 140,height: 30,),centerTitle: true,),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Image.asset('assets/images/lets_start.png'),

<<<<<<< HEAD
          Text('letsGoTitle',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14,color:isDark? Colors.white: Colors.black ),textAlign: TextAlign.start,).tr(),

   SizedBox(height: 8,)
        ,Text('letsGodesc',style: Theme.of(context).textTheme.bodyMedium).tr(),SizedBox(height: 16,)
=======
          Text('letsGoTitle',style: StylesApp.style20Bold,textAlign: TextAlign.start,).tr(),

   SizedBox(height: 8,)
        ,Text('letsGodesc',style: StylesApp.style16Bold,).tr(),SizedBox(height: 16,)
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92

           , Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

<<<<<<< HEAD
             Text('language',style:  Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),).tr(),
=======
             Text('language',style: StylesApp.style18BlueBold,).tr(),
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
                LangButton(title: 'English', secTitle: 'Arabic',),
             ],),

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

<<<<<<< HEAD
          Text('Theme',style:  Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),).tr(),
=======
          Text('Theme',style: StylesApp.style18BlueBold,).tr(),
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
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

<<<<<<< HEAD
            }, child: Center(child: Text('letsGoBtn', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)).tr())),
=======
            }, child: Center(child: Text('letsGoBtn', style: StylesApp.style20WhiteBold,).tr())),
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
          )
          ],)),
      ),);
  }
}
