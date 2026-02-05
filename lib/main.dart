import 'package:easy_localization/easy_localization.dart';
<<<<<<< HEAD
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/auth_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/theme_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/login_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/signup_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/add_event_screen.dart';
=======
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/theme_provider.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/login_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/signup_screen.dart';
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/home_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/intoduction_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/lets_start_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'core/theme_app.dart';
=======
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
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
<<<<<<< HEAD
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(


          create: (context) => ThemeProvider(),),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child:
             MyApp(),
      )
=======
      child: ChangeNotifierProvider(


          create: (context) => ThemeProvider(),
          child: MyApp())
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<ThemeProvider>(context);
<<<<<<< HEAD
    var user= Provider.of<AuthProvider>(context);

    return MaterialApp(

=======
    return MaterialApp(
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
themeMode: provider.themeMode,
<<<<<<< HEAD
       darkTheme: ThemeApp.darkTheme,
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
    initialRoute: user.fireaseUser !=null? HomeScreen.routeName : LoginScreen.routeName,
=======
       darkTheme: ThemeData.light(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    initialRoute: LetsStartScreen.routeName,
>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
      routes: {
        LetsStartScreen.routeName : (context) => LetsStartScreen(),
        IntoductionScreenLite.routeName :(context) => IntoductionScreenLite(),
        LoginScreen.routeName : (context) => LoginScreen(),
        SignupScreen.routeName :(context) => SignupScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),

<<<<<<< HEAD
        AddEventScreen.routeName :(context)=>AddEventScreen(),
=======

>>>>>>> 3fff189fde13fa9ca2ac3ebbf602c1aad1538b92
    },

    );
  }

}
