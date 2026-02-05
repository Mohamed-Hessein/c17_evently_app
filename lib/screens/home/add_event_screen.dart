
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/firebase_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/app_colors.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/widgets/next_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/chips_provider.dart';

class AddEventScreen extends StatefulWidget {
   AddEventScreen({super.key});
static const routeName = 'add_event';

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
DateTime? selectedDate =DateTime.now();
TextEditingController descController = TextEditingController();
TextEditingController titleController = TextEditingController();



  List<String> chipsIcList = ['bike','book','birthday-cake','birthday-cake','birthday-cake',];
List<String> images = ['Sport','Book Club','Birthday','Meeting','Exhibition'];
  List<String> chipsNames = ['Sport','Book club','Birthday','Meeting','Exhibition'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => ChipsProvider()),

      ],
      builder:  (context, child){  var provider = Provider.of<ChipsProvider>(context);

        return Directionality(
         textDirection: TextDirection.ltr,
          child: Scaffold(appBar: AppBar(centerTitle: true,automaticallyImplyLeading:  false,title: Text('Add event',style:Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14,color: Colors.black),),leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: ImageIcon(AssetImage('assets/images/arrow-left.png'),size: 24,color: AppColors.blueApp,)),
          ),),body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:

                 SingleChildScrollView(
                   child: Column(

                                     crossAxisAlignment: CrossAxisAlignment.stretch,
                                     children: [Image.asset('assets/images/${images[provider.selectedIndex]}.png',width: 343,height: 193,fit: BoxFit.cover,),
                    Container(
                        height: 60,
                        child: ListView.separated(

                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                onTap: (){
                                  provider.changeChipsClick(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Wrap(
                                    spacing: 8,
                                    children: [
                                      isDark?    Chip(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius
                                      .circular(20)),
                                  backgroundColor: provider
                                      .selectedIndex == index

                                      ? Color(0xFF002D8F): Color(0xFF001440),
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            'assets/images/${chipsIcList[index]}.png'),
                                        color: provider.selectedIndex ==
                                            index
                                            ? Colors.white
                                            : AppColors.blueApp,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        '${chipsNames[index]}',
                                        style: TextStyle(color: provider
                                            .selectedIndex == index
                                            ? Colors.white
                                            : Colors.white,),
                                      ),
                                    ],
                                  ))
                                  :Chip(

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(20)),
                                        backgroundColor: provider
                                            .selectedIndex == index
                                            ? AppColors.blueApp
                                            : Colors.white,
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                  'assets/images/${chipsIcList[index]}.png'),
                                              color: provider.selectedIndex ==
                                                  index
                                                  ? Colors.white
                                                  : AppColors.blueApp,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              '${chipsNames[index]}',
                                              style: TextStyle(color: provider
                                                  .selectedIndex == index
                                                  ? Colors.white
                                                  : AppColors.blueApp,),
                                            ),
                                          ],
                                        ),
                                      ) ,
                                    ],
                                  ),
                                ),
                              );

                            }, separatorBuilder: (context,i){
                          return SizedBox.shrink();
                        }, itemCount: chipsIcList.length)
                    ),
SizedBox(height: 12,),

                    TextFormField(
                      controller: titleController,

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: isDark? Color(0xFF001440) : Colors.white,enabledBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,

                        border: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,
                        focusedBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,
                          errorBorder: isDark? OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xff002D8F))): InputBorder.none,

                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Event Title',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),

                        labelText: 'Title',
                        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12)
                    ),),
                    SizedBox(height: 12,),
                    TextFormField(
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


                          hintText: 'Event Description....',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          hintStyle: Theme.of(context).textTheme.labelMedium,
                          labelText: 'Description ',
                          labelStyle:Theme.of(context).textTheme.labelMedium!.copyWith()
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,


                      children: [Row(children: [ImageIcon(AssetImage('assets/images/calendar-add.png'),color: AppColors.blueApp,),SizedBox(width: 10,),Text('Event Date',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16,),)],), GestureDetector(
                          onTap: (){
                            ChooseDate();
                          },
                          child: Text('${selectedDate.toString().substring(0,10)}',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.blueApp,fontSize: 16,fontWeight: FontWeight.bold)))],),


                   SizedBox(height: 50,),

                    NextButton(text: 'Add Event', onPressed: (){
                    var  providerIndex = provider.selectedIndex;
                    Navigator.pop(context);
                  var event =    FirebaseModel(title: titleController.text,
                      date: selectedDate!.millisecondsSinceEpoch,
                        desc: descController.text,
                        idUser: FirebaseAuth.instance.currentUser!.uid,
                        catgory:images[provider.selectedIndex] ,
                      );
                      FirebaseFunctions.createEvent(event);

                    }),
                                     ],),
                 ),


          ),),
        );
      },

    );


  }

   ChooseDate() async{

   DateTime? dateChoosed = await  showDatePicker(

       builder: (context, child)=> Theme(data: ThemeData(), child: child!),
       context: context,initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
   if(dateChoosed !=null){
     selectedDate =dateChoosed;
     setState(() {

     });
   }


  }
}
