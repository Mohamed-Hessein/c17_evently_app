import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/widgets/next_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_filed.dart';

class ForgotPassScreen extends StatelessWidget {
   ForgotPassScreen({super.key});
static const routeName =  '/Forgotpass';

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Forget Password',style: Theme.of(context).appBarTheme.titleTextStyle,),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/change-setting.png',width: 343,height: 343,),
              CustomTextFeild(
                controller: emailController,
                valdaitor:  (value){
                  if(value!.isEmpty || value == null){
          
                    return 'enter vaild email';
                  }
          
          
                },
          
                isPass: false,hintText: 'Enter your email',image: 'assets/images/email.png',),
            SizedBox(height: 51,),
            NextButton(text: 'Reset password', onPressed: (){
              FirebaseFunctions.resetPassWord(emailController.text);
            })
            ],),
        ),
      ),
    );
  }
}
