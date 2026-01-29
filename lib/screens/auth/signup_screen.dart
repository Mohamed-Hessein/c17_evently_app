import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/stylesApp.dart';
import '../../widgets/custom_text_filed.dart';
import '../../widgets/next_button.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
static const routeName = 'signup';
GlobalKey<FormState> globalKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();

   TextEditingController passWordController = TextEditingController();
   TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 17),
        child: SafeArea(
          child: Form(key: globalKey,
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
                      child: Text('Create your account',style: StylesApp.style24BlueBold,))
              
                  ,
              
                  SizedBox(height: 24,),
              CustomTextFeild(isPass: false,hintText: 'Enter your Name',image: 'assets/images/user.png',controller: nameController,valdaitor: (value){
                if(value!.isEmpty  || value == null){
              
                  return 'enter vaild email';
                }
              
              },),    SizedBox(height: 16,)
                  , CustomTextFeild(valdaitor: (value){
                  if(value!.isEmpty  || value == null){
              
                    return 'enter vaild email';
                  }
              
              
                  },isPass: false,hintText: 'Enter your email',image: 'assets/images/email.png',controller: emailController,),
                  SizedBox(height: 16,),CustomTextFeild(valdaitor: (value){
                    if(value!.isEmpty  || value == null){
              
                      return 'enter vaild email';
                    }
              
              
                  },isPass: true,hintText: 'Enter your PassWord',image: 'assets/images/lock.png',controller: passWordController,),
                 SizedBox(height: 16,), CustomTextFeild(
                    valdaitor: (value){
                      if(value!.isEmpty  || value == null){
              
                        return 'enter vaild email';
                      }
              
              
                    }
                  ,isPass: true,hintText: 'Confirm your password',image: 'assets/images/lock.png',controller: passWordController,),
              
                  SizedBox(height: 48,),
                  NextButton(text: 'Sign Up', onPressed: (){
              
                    if(globalKey.currentState!.validate()){
                      FirebaseFunctions.signUp(emailController.text,nameController.text, passWordController.text, onError: (massge){
              
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massge.toString())));
                      }, onSucess: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      });
                    }
              
                  }),
                  SizedBox(height: 48,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [       GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Text(' login ',style: StylesApp.style14BlueBold,)) ,Text('? Don’t have an account ',style: StylesApp.style14Bold,),
              
              
                    ],),
                  SizedBox(height: 32,),
                  Center(child: Text('Or',style: StylesApp.style16BlueBold,)),
                  SizedBox(height: 24,),
                  SizedBox(width: 343,height: 48,
                      child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
              
                          elevation: 0,
                          backgroundColor: Colors.white), child: Padding(
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
