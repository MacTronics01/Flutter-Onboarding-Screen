import 'package:flutter/widgets.dart';

class SliderModel{
  late String imagePath;
  late String title;
  late String desc;

  SliderModel({required this.imagePath,required this.title,required this.desc});
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc =getDesc;
  }
  String getImageAssetPath(){
    return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDec(){
    return desc;
  }

}
List<SliderModel>? getSlides (){
  List<SliderModel> slides =<SliderModel>[];
  SliderModel sliderModel =new SliderModel(imagePath: 'assets/burger.jpg', title: 'Search', desc: 'Discover Restaurants offering this best fast food near you on MacKitchen.');
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: 'assets/spaghetti2.png', title: 'Order', desc: 'Our veggies plan is filled with delicious seasonal vegetables. whole grains, beautiful cheeses and vegetarian protein.');
  slides.add(sliderModel);

  sliderModel = new SliderModel(imagePath: 'assets/jollof-rice-with-fried.jpg', title: 'Eat', desc: 'Food delivery or pickup from local restaurants, Explore restaurants that delivers near you.');
  slides.add(sliderModel);
return slides;

}