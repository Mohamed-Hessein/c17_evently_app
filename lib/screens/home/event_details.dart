import 'package:easy_localization/easy_localization.dart' show DateFormat;
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/event_edit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/firebase_model.dart';
import '../../core/app_colors.dart';
import '../../core/firebase_functions.dart';
import '../../provider/chips_provider.dart';
import '../../widgets/next_button.dart';

class EventDetails extends StatelessWidget {
  static const routName = 'details';
  EventDetails({super.key}); List<String> chipsIcList = ['bike','book','birthday-cake','birthday-cake','birthday-cake',];
   List<String> images = ['Sport','Book Club','Birthday','Meeting','Exhibition'];
   List<String> chipsNames = ['Sport','Book club','Birthday','Meeting','Exhibition'];
   DateTime? selectedDate =DateTime.now();
   TextEditingController descController = TextEditingController();
   TextEditingController titleController = TextEditingController();



   @override
  Widget build(BuildContext context) {final FirebaseModel item =
   ModalRoute.of(context)!.settings.arguments as FirebaseModel;

   final isDark = Theme.of(context).brightness == Brightness.dark;
   DateFormat fromatdate = DateFormat('dd MMM');
  return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => ChipsProvider()),

      ],
      builder:  (context, child){  var provider = Provider.of<ChipsProvider>(context);

      var stremPRovider = context.watch<ChipsProvider>();
    var index  = stremPRovider.selectedIndex;
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(appBar: AppBar(actions: [GestureDetector(  onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EventEdit(item: item),
            ),
          );

        }, child: ImageIcon(AssetImage('assets/images/edit-2.png'),color: AppColors.blueApp,)),SizedBox(width: 5,),GestureDetector(
            onTap: (){
              FirebaseFunctions.deleteTask(item);
              Navigator.pop(context);
            },child: Icon(Icons.delete,color: Colors.red,)),SizedBox(width: 5,)],centerTitle: true,automaticallyImplyLeading:  false,title: Text(' Event Details',style:Theme.of(context).appBarTheme.titleTextStyle,),leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: ImageIcon(AssetImage('assets/images/arrow-left.png'),size: 24,color: AppColors.blueApp,)),
        ),),body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:

          SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [   ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(       width: 343,
                  height:
                  193,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFF002D8F) : Colors.white)),image:DecorationImage(fit: BoxFit.cover,image: AssetImage(  'assets/images/${item.catgory}${isDark ? "_dark" : ""}.png',
                  ))),

                ),
              ),           SizedBox(height: 12,),
                Text('We’re going to play football ',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18,fontWeight: FontWeight.w500),)
           ,     SizedBox(height: 12,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,
                  horizontal: 8),
                  height: 76,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFf002D8F): Colors.white)),
                      color: isDark? Color(0xFF001440) : Colors.white,borderRadius: BorderRadius.circular(16)),
                  child: Row(



                    children: [Row(children: [ImageIcon(AssetImage('assets/images/calendar-add.png'),color: AppColors.blueApp,),SizedBox(width: 10,),],), GestureDetector(
                        onTap: (){

                        },
                        child: Text('${fromatdate.format(DateTime.fromMillisecondsSinceEpoch( item.date) )}',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.blueApp,fontSize: 16,fontWeight: FontWeight.bold)))],),
                ),
                SizedBox(height: 24,),
                TextFormField(
                  readOnly: true,
                  controller: descController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: isDark? Color(0xFF001440) : Colors.white,

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,

                      border: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,
                      focusedBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,
                      errorBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,


                      hintText: '${item.desc}',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      labelText: 'Description ',
                      labelStyle:Theme.of(context).textTheme.labelMedium!.copyWith()
                  ),),



SizedBox(height: 50,),





              ],),
          ),


        ),),
      );
      },

    );
  }
}
