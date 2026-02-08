import 'package:easy_localization/easy_localization.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/firebase_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/theme_app.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../../core/stylesApp.dart';
import '../../provider/auth_provider.dart';
import '../../provider/chips_provider.dart';
import 'add_event_screen.dart';
import 'event_details.dart';



class EventScreen extends StatelessWidget {
   EventScreen({super.key});

   List<String> chipsIcList = ['all','bike','book','birthday-cake','birthday-cake','birthday-cake',];
   List<String> images = ['all','Sport','Book Club','Birthday','Meeting','Exhibition'];
   List<String> chipsNames = ['all','Sport','Book club','Birthday','Meeting','Exhibition'];
  @override
  Widget build(BuildContext context) {final isDark = Theme.of(context).brightness == Brightness.dark;


  ThemeApp themeApp = ThemeApp();
    var user = Provider.of<AuthProvider>(context);

    DateFormat fromatdate = DateFormat('dd MMM');


    return ChangeNotifierProvider(
        create: (_) =>
        ChipsProvider()
          ..getTasksStram(),
        builder: (context, child) {

          var stremPRovider = context.watch<ChipsProvider>();
          var provider = Provider.of<ChipsProvider>(context);
          return
            Scaffold(
                appBar: AppBar(
automaticallyImplyActions: false,
                  actions: [
                    ImageIcon(AssetImage( isDark? 'assets/images/moon.png':'assets/images/sun_ic.png'),
                      color: AppColors.blueApp, size: 24,),
                    SizedBox(width: 8,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(width: 34,
                        height: 32,
                        decoration: BoxDecoration(shape: BoxShape.rectangle,
                            color: AppColors.blueApp),
                        child: Center(child: Text('EN',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 8,)
                  ],
                  actionsPadding: EdgeInsets.only(left: 50),
                  title: Align(


                    alignment: Alignment.topLeft,
                    child: Column(


                      children: [
                        Text(' Welcome Back ✨', style: StylesApp.style14Bold,),

                        SizedBox(height: 2,),
                        Text(user.userModel?.name ??'',
                          style: Theme.of(context).textTheme.titleLarge),
                      ],),
                  ),

                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 60,
                          child: ListView.separated(

                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    provider.changeChipsClick(index);

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Wrap(
                                      spacing: 8,
                                      children: [
                                        isDark ? Chip(
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius
                                           .circular(20)),
                                   backgroundColor: provider
                                       .selectedIndex == index

                                       ? Color(0xFF457AED): Color(0xFF001440),
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
                                   ),
                                 ): Chip(

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
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }, separatorBuilder: (context, i) {
                            return SizedBox.shrink();
                          }, itemCount: chipsIcList.length)
                      ),

                      Expanded(child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, EventDetails.routName,arguments: stremPRovider.tasks[index]);
                              },
                              child: Dismissible(
                                onDismissed: ( modle){
                                  FirebaseFunctions.deleteTask(stremPRovider.tasks[index]);
                                },
                                background: Container(color: Colors.red,child: Icon(Icons.delete,size: 24,),),
                                secondaryBackground: Container(color: Colors.red,child: Icon(Icons.remove),),
                                key: ValueKey(stremPRovider.tasks[index].id),

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 16),
                                    child: Stack(
                                
                                        children: [
                                
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(       width: 343,
                                        height:
                                        193,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFF002D8F) : Colors.white)),image:DecorationImage(image: AssetImage(  'assets/images/${stremPRovider.tasks[index].catgory}${isDark ? "_dark" : ""}.png',
                                        ))),
                                        
                                      ),
                                    ),
                                          Positioned(
                                            bottom: 5,
                                            left: 5,
                                            child: Container(
                                
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border:  Border.fromBorderSide(BorderSide(width: 2,color:isDark? Color(0xFF002D8F) : Colors.white, )),
                                                color: isDark ?   Color(0xFF000F30) : Color(0xFFF4F7FF),),
                                              width: 335,
                                              height: 40,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Text('${stremPRovider.tasks[index]
                                                        .title}',
                                                      style: isDark? Theme.of(context).textTheme.labelLarge!
                                                          .copyWith(color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .w500):Theme.of(context).textTheme.labelLarge!
                                                          .copyWith(color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500) ,),
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        var task = provider
                                                            .tasks[index];
                                                        task.isFav = !task.isFav;
                                                        provider.isFav(task);
                                                      },
                                                      child: provider.tasks[index]
                                                          .isFav == true ? Icon(
                                                          Icons.favorite,color: isDark? Color(0xFF457AED):AppColors.blueApp,) : Icon(
                                                          Icons.favorite_border,color: isDark? Color(0xFF457AED):AppColors.blueApp,
                                                      )),
                                                ],),
                                            ),
                                          ),
                                          Positioned(
                                              top: 20,
                                              left: 20,
                                              child: Container(
                                
                                                padding: EdgeInsetsDirectional.all(8),
                                                child: Text('${fromatdate.format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                        stremPRovider.tasks[index]
                                                            .date))}',
                                                  style:isDark? Theme.of(context).textTheme.labelLarge!.copyWith(color: Color(0xFF457AED)) : Theme.of(context).textTheme.labelLarge,),
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.fromBorderSide(BorderSide(width: 3,color:!isDark ? Color(0xFFF4F7FF) : Color(0xFF002D8F))), color: !isDark ? Color(0xFFF4F7FF) : Color(0xFF000F30)),))
                                        ]
                                    ),
                                  ),
                              ),
                              ),
                            );
                          }, separatorBuilder: (context, i) {
                        return SizedBox.shrink();
                      }, itemCount: stremPRovider.tasks.length))


                    ],


                  ),
                )
,
                floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(99),
          child: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, AddEventScreen.routeName);},backgroundColor:isDark? Color(0xFF457AED):AppColors.blueApp,child: Icon(Icons.add,color: Colors.white,),)),);


        }


    );
  }




  }

