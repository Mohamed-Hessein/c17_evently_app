import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/app_colors.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/screens/home/profle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/chips_provider.dart';
import 'add_event_screen.dart';
import 'event_screen.dart';
import 'fav_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex =0;

List<String> chipsIcList = ['all','bike','birthday-cake','book'];

List<String> chipsNames = ['All','Sport','Birthday','Book club'];
List<Widget> screens = [EventScreen(),FavScreen(),Profle()];

  @override
  Widget build(BuildContext context) {final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(

bottomNavigationBar: BottomNavigationBar(


  type: BottomNavigationBarType.fixed,
  onTap: (index){
    selectedIndex =index;
    setState(() {

    });
  },
  selectedIconTheme:IconThemeData(color: AppColors.blueApp) ,
selectedLabelStyle:  TextStyle(fontSize: 12,color: AppColors.blueApp),
  currentIndex:selectedIndex ,
  items: [
  BottomNavigationBarItem(icon:  ImageIcon(AssetImage('assets/images/home.png'),),label: 'Home',),
  BottomNavigationBarItem(

      icon: selectedIndex ==1? ImageIcon(AssetImage('assets/images/fill_heart.png'),):ImageIcon(AssetImage('assets/images/heart.png'),),label: 'Favorite'),
  BottomNavigationBarItem(icon: selectedIndex == 2? ImageIcon(AssetImage('assets/images/selected_profile_ic.png'),):ImageIcon(AssetImage('assets/images/profile_ic.png'),),label: 'Profile'),




],),


 body:screens[selectedIndex] ,
          ),
    );
  }
}
