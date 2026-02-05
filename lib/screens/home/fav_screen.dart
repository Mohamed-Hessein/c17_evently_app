import 'package:easy_localization/easy_localization.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/provider/fav_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../../core/stylesApp.dart';
import '../../provider/chips_provider.dart';

class FavScreen extends StatelessWidget {
   FavScreen({super.key});

  List<String> chipsIcList = ['all','bike','birthday-cake','book'];

  List<String> chipsNames = ['All','Sport','Birthday','Book club'];
  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;


    DateFormat fromatdate = DateFormat('dd MMM');
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Scaffold(body:  MultiProvider(

          providers: [
            ChangeNotifierProvider(create: (_) => FavProvider()..getFavTasks()),
          ],
          builder: (context ,child ){
            var stremPRovider = context.watch<FavProvider>();
            var provider = Provider.of<FavProvider>(context);
            return
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 1),
        child: TextFormField(decoration: InputDecoration(
        hintText: 'Search for event',
        hintStyle:Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageIcon(AssetImage('assets/images/search.png'),color:isDark? Colors.white: Colors.black),
        ),
        border: InputBorder.none


        ),
        ),
      ),
                    Expanded(child: ListView.separated(itemBuilder: (context, index){

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                        child: Stack(

                            children:[ Image.asset('assets/images/${stremPRovider.tasks[index].catgory}.png',width: 343,height:
                            193,),
                              Positioned(
                                bottom :5,
                                left: 5,
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border:  Border.fromBorderSide(BorderSide(width: 2,color:isDark? Color(0xFF002D8F) : Colors.white, )),
                                    color: isDark ?   Color(0xFF000F30) : Color(0xFFF4F7FF),),
                                  width: 335,
                                  height: 40,child: Row(
                                    mainAxisAlignment :MainAxisAlignment.spaceBetween,

                                    children: [Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('${stremPRovider.tasks[index].title}',style: isDark? Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white
                                      ):  Theme.of(context).textTheme.labelLarge
                                          !.copyWith(color: Colors.black,
                                          fontWeight: FontWeight
                                              .w500),),
                                    ),
                                      GestureDetector(
                                          onTap: (){
                                            var task = provider.tasks[index];
                                            task.isFav =!task.isFav;
                                            provider.isFav(task);
                                          },
                                          child: provider.tasks[index].isFav == true?  Icon(Icons.favorite):Icon(Icons.favorite_border)),
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
                                      style:isDark? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.labelLarge,),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.fromBorderSide(BorderSide(width: 3,color:!isDark ? Color(0xFFF4F7FF) : Color(0xFF002D8F))), color: !isDark ? Color(0xFFF4F7FF) : Color(0xFF000F30)),))
                            ]
                        ),
                      );

                    }, separatorBuilder: (context,i){
                      return SizedBox.shrink();
                    }, itemCount: stremPRovider.tasks.length))


                  ],




                ),
              );
          }
      ),),
    );
  }
}
