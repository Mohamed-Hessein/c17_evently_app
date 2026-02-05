import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/theme_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class Profle extends StatelessWidget {
  const Profle({super.key});

  @override
  Widget build(BuildContext context) {final isDark = Theme.of(context).brightness == Brightness.dark;


  var theme = Provider.of<ThemeProvider>(context);

    var user = Provider.of<AuthProvider>(context);
    if (user.userModel == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(

      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ClipRRect(
          borderRadius: BorderRadius.circular(90),
            child: Image.asset('assets/images/Profile pic.png',width: 116,height: 116,)),

        SizedBox(height: 5,),
          Text(user.userModel?.name??'',textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge!.copyWith(),)
      ,
          Text(user.userModel?.email??'',textAlign: TextAlign.center,style:  Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 48,),
          GestureDetector(
            onTap: (){
              theme.changTheme(ThemeMode.dark);},
            child: Container(
              width: double.infinity,
    decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFf002D8F): Colors.white)),
    color: isDark? Color(0xFF001440) : Colors.white,borderRadius: BorderRadius.circular(16)),
    height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 10),
                child: Text(textAlign: TextAlign.start,'Dark mode',style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
              ),
            ),
          )
         ,SizedBox(height: 32,),
      Container(
        height: 48,
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFf002D8F): Colors.white)),
            color: isDark? Color(0xFF001440) : Colors.white,borderRadius: BorderRadius.circular(16)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [    Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text('Language',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
        ),
        ImageIcon(AssetImage('assets/images/arrow-right.png'),size: 24,)

        ],),
      ),
      SizedBox(height: 32,),
    Container(height: 48,
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFf002D8F): Colors.white)),
          color: isDark? Color(0xFF001440) : Colors.white,borderRadius: BorderRadius.circular(16)),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text('Logout',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
      ),
      GestureDetector(
          onTap: (){
            FirebaseFunctions.logOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.routeName,
                  (route) => false,
            );

          },
          child: ImageIcon(AssetImage('assets/images/logout.png'),color: Colors.red,size: 24,))

      ],),
    )

        ],),
    ),);
  }
}
