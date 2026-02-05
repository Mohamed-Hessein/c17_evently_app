import 'package:easy_localization/easy_localization.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/auth_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/theme_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/login_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/signup_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/add_event_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/home_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/intoduction_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/lets_start_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/theme_app.dart';
import 'firebase_options.dart';
void main()  async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

await EasyLocalization.ensureInitialized();

runApp(
  EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'us'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(


          create: (context) => ThemeProvider(),),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child:
             MyApp(),
      )
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<ThemeProvider>(context);
    var user= Provider.of<AuthProvider>(context);

    return MaterialApp(

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
themeMode: provider.themeMode,
       darkTheme: ThemeApp.darkTheme,
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
    initialRoute: user.fireaseUser !=null? HomeScreen.routeName : LoginScreen.routeName,
      routes: {
        LetsStartScreen.routeName : (context) => LetsStartScreen(),
        IntoductionScreenLite.routeName :(context) => IntoductionScreenLite(),
        LoginScreen.routeName : (context) => LoginScreen(),
        SignupScreen.routeName :(context) => SignupScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),

        AddEventScreen.routeName :(context)=>AddEventScreen(),
    },

    );
  }

}
