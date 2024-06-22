import 'dart:ui';
import 'package:news_app/Theme_Data.dart';

class CategoryDM{
  String id;
  String title;
  String imagePath;
  Color color ;
  CategoryDM({required this.id,required this.title,required this.imagePath,
  required this.color});
static List<CategoryDM>getCategories() {
   return [
     CategoryDM(id: 'Sports', title: 'Sports', imagePath: 'assets/images/ball.png', color: MyTheme.redColor),
     CategoryDM(id: 'business', title: 'business', imagePath: 'assets/images/bussines.png', color: MyTheme.brownColor),
     CategoryDM(id: 'health', title: 'health', imagePath: 'assets/images/health.png', color: MyTheme.pinkColor),
     CategoryDM(id: 'science', title: 'science', imagePath: 'assets/images/science.png', color: MyTheme.yellowColor),


   ];
}
}