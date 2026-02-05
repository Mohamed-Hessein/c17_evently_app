import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_colors.dart';
import '../provider/chips_provider.dart';

class ListChips extends StatelessWidget {
   ListChips({super.key});
  List<String> chipsIcList = ['all','bike','book','birthday-cake','birthday-cake','birthday-cake',];
  List<String> images = ['all','Sport','Book Club','Birthday','Meeting','Exhibition'];
  List<String> chipsNames = ['all','Sport','Book club','Birthday','Meeting','Exhibition'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return  ChangeNotifierProvider(
        create: (_) =>
            ChipsProvider()..getTasksStram(),builder: (context, child){
      var provider = Provider.of<ChipsProvider>(context);
          return  Container(
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
              );
    }

    );
  }
}
