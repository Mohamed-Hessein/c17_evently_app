import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/signup_screen.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/widgets/next_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../widgets/custom_text_filed.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
static const routeName = 'login';
TextEditingController emailController = TextEditingController();
TextEditingController passWordController = TextEditingController();
GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {   var user = Provider.of<AuthProvider>(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(


      body: Padding(
      padding: const EdgeInsets.symmetric( horizontal: 17),
      child: SafeArea(
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            
              children: [
                SizedBox(height: 16,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/logo_app_bar.png',width: 142,height: 27,),
                  )),
            SizedBox(height: 42,),
            
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Login to your account',style: Theme.of(context).textTheme.titleLarge,))
            
            ,
            
              SizedBox(height: 24,)
              , CustomTextFeild(
                  controller: emailController,
                  valdaitor:  (value){
                  if(value!.isEmpty || value == null){
            
                  return 'enter vaild email';
                  }
            
            
                  },
            
                  isPass: false,hintText: 'Enter your email',image: 'assets/images/email.png',),
            SizedBox(height: 16,),CustomTextFeild(
                  controller: passWordController,
                  valdaitor:  (value){
                    if(value!.isEmpty  || value == null){
            
                      return 'enter vaild email';
                    }
            
            
                  },
            
            
                isPass: true,hintText: 'Enter your PassWord',image: 'assets/images/lock.png',),
            
                Text('?Forget Password',style: StylesApp.style14BlueBold,),
                SizedBox(height: 48,),
                NextButton(text: 'Login', onPressed: (){
                  if(globalKey.currentState!.validate()){
                    FirebaseFunctions.logIn(emailController.text, passWordController.text, onError: (message){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));
                    }, onSuces: (){
                      user.init();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    });
                  }
            
            
                }),
                SizedBox(height: 48,),
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [       GestureDetector(onTap: (){
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  },
                      child: Text(' Signup ',style: StylesApp.style14BlueBold,)) ,Text('? Don’t have an account ',style: StylesApp.style14Bold,),
            
            
                  ],),
                SizedBox(height: 32,),
                Center(child: Text('Or',style: StylesApp.style16BlueBold,)),
            SizedBox(height: 24,),
                SizedBox(width: 343,height: 48,
                child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
            
                    elevation: 0,
                    backgroundColor:isDark?  Color(0xFF002D8F):Colors.white), child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(children: [Text('Login with Google',style: StylesApp.style18Blue500,),SizedBox(width: 15,), Image.asset('assets/images/google.png',width: 24,height: 24,),],),
                    ))),
              ],),
          ),
        ),
      ),
    ),);
  }
}
