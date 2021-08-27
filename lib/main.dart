import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mac_onboarding_screen/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OnBoarding Screen",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<SliderModel> slides =<SliderModel>[];
  int CurrentIndex =0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    slides=getSlides()!;
  }
  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 2),
      height: isCurrentPage? 10 :6,
      width: isCurrentPage? 10:6,
      decoration: BoxDecoration(
          color: isCurrentPage? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              CurrentIndex =val;
            });

          },
          itemBuilder: (context,index){
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDec(),
            );
          }),
      bottomSheet:
      CurrentIndex != slides.length -1 ?Container(
        height: Platform.isAndroid? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  pageController.animateToPage(slides.length -1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text('SKIP')
            ),
            Row(
              children: [
                for(int i=0; i<slides.length; i++) CurrentIndex== i ?pageIndexIndicator(true) :pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
                onTap: () {
                  pageController.animateToPage(CurrentIndex +1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text('NEXT')
            ),
          ],
        ),
      ): Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isAndroid? 70:60,
        color: Colors.lightGreen[500],
        child: Text('GET STARTED NOW',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
        ),),

      ),
    );
  }
}
class SliderTile extends StatelessWidget {
  String imageAssetPath,title,desc;
  SliderTile({required this.imageAssetPath,required this.title,required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          SizedBox(height: 20,),
          Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),),
          SizedBox(height: 12,),
          Text(desc, textAlign:TextAlign.center, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),)
        ],
      ),
    );
  }
}

