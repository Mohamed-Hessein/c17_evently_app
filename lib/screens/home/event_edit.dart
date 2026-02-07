
import 'package:easy_localization/easy_localization.dart' show DateFormat;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/firebase_model.dart';
import '../../core/app_colors.dart';
import '../../core/firebase_functions.dart';
import '../../provider/chips_provider.dart';
import '../../widgets/next_button.dart';

class EventEdit extends StatefulWidget {

  static const routName = '/edit';
  final FirebaseModel? item;
  EventEdit({super.key,  this.item});

  @override
  State<EventEdit> createState() => _EventEditState();

}

class _EventEditState extends State<EventEdit> {


  List<String> chipsIcList = ['bike','book','birthday-cake','birthday-cake','birthday-cake',];
  List<String> images = ['Sport','Book Club','Birthday','Meeting','Exhibition'];
  List<String> chipsNames = ['Sport','Book club','Birthday','Meeting','Exhibition'];
  DateTime? selectedDate =DateTime.now();

  List<String> imagesDark = ['Sport_dark','Book Club_dark','Birthday_dark','Meeting_dark','Exhibition_dark'];


  late TextEditingController descController ;
  late TextEditingController titleController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descController = TextEditingController(text: widget.item!.title);
    titleController= TextEditingController(text: widget.item!.desc);
  }

  @override

  Widget build(BuildContext context) {

    DateFormat fromatdate = DateFormat('dd MMM');
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => ChipsProvider()..editEvent),

      ],
      builder:  (context, child){  var provider = Provider.of<ChipsProvider>(context);

      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(appBar: AppBar(centerTitle: true,automaticallyImplyLeading:  false,title: Text('Add event',style:Theme.of(context).appBarTheme.titleTextStyle,),leading: Padding(
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
              children: [   ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(       width: 343,
                  height:
                  193,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.fromBorderSide(BorderSide(color: isDark? Color(0xFF002D8F) : Colors.white)),image:DecorationImage(fit: BoxFit.cover,image: AssetImage(  isDark? 'assets/images/${imagesDark[provider.selectedIndex]}.png':  'assets/images/${images[provider.selectedIndex]}.png',
                  ))),

                ),
              ),      Container(
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
                      hintText: '${widget.item!.title}',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),

                      labelText: 'Title',
                      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12)
                  ),),
                SizedBox(height: 24,),
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
                      labelText: '${widget.item!.desc}',
                      labelStyle:Theme.of(context).textTheme.labelMedium!.copyWith()
                  ),),SizedBox(height: 24,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                  children: [Row(children: [ImageIcon(AssetImage('assets/images/calendar-add.png'),color: AppColors.blueApp,),SizedBox(width: 10,),Text('Event Date',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16,),)],), GestureDetector(
                      onTap: (){
                        ChooseDate();
                      },
                      child:Text('${selectedDate.toString().substring(0,10)}',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.blueApp,fontSize: 16,fontWeight: FontWeight.bold)))],),

                SizedBox(height: 50,),

                NextButton(text: 'Add Event', onPressed: (){
                  var  providerIndex = provider.selectedIndex;
                  Navigator.pop(context);
                  var event =    FirebaseModel(
                    id: widget.item!.id,
                    title: titleController.text,
                    date: selectedDate!.millisecondsSinceEpoch,
                    desc: descController.text,
                    idUser: FirebaseAuth.instance.currentUser!.uid,
                    catgory:images[provider.selectedIndex] ,
                  );
                  FirebaseFunctions.upDate(event);
                  Navigator.pop(context);

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
  if(dateChoosed !=null) {
    selectedDate = dateChoosed;
    setState(() {

    });
  }}
}