import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/stylesApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../widgets/next_button.dart';
import 'auth/login_screen.dart';
class IntoductionScreenLite extends StatefulWidget {
  static const String routeName  = '/intro';
   IntoductionScreenLite({super.key});

  @override
  State<IntoductionScreenLite> createState() => _IntoductionScreenLiteState();
}

class _IntoductionScreenLiteState extends State<IntoductionScreenLite> {

  final GlobalKey<IntroductionScreenState> key =
  GlobalKey<IntroductionScreenState>();
  int currentIndex = 0;
List<PageViewModel> pageList = [
  PageViewModel(image: Image.asset('assets/images/intro1.png',height: 343,width: 343,),titleWidget: Text('Find Events That Inspire You',style: StylesApp.style20Bold,),bodyWidget: Text('Dive into a world of events crafted to fit your unique interests. Whether youre into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',style: StylesApp.style16Bold,)),

PageViewModel(image:Image.asset('assets/images/intro2.png',height: 343,width: 343,),titleWidget: Text('Effortless Event Planning',style: StylesApp.style20Bold,),bodyWidget: Text('Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',style: StylesApp.style16Bold,) )
,
PageViewModel(image:Image.asset('assets/images/intro3.png',height: 343,width: 343,),titleWidget: Text('Connect with Friends & Share Moments',style: StylesApp.style20Bold,),bodyWidget: Text('Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',style: StylesApp.style16Bold,) )
];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onChange: (index){
        setState(() {
          currentIndex =index;
        });
      },
      key: key,
      showBottomPart: true,  dotsDecorator: const DotsDecorator(
      size: Size.zero,
fadeOutSize: Size.zero,
      activeSize: Size.zero
    ),
bodyPadding: EdgeInsets.only(top: 60),
      showFirstBackButton: false,
      pages: pageList,
showSkipButton: false,
      isProgress:  false,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
globalHeader: SafeArea(child: Image.asset('assets/images/logo_app_bar.png',width: 142,height: 27,)),
      globalFooter: Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: NextButton(text: 'Next',onPressed: () {
          if (currentIndex == pageList.length - 1) {
            Navigator.pushNamed(context, LoginScreen.routeName);
          } else {
            key.currentState!.next();
          }
        }, ),
      ),
    ),

    );
  }
}
