import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';

import '../model/category_dm.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM category;
  int index;
  CategoryItem({super.key, required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:category.color,
        borderRadius: BorderRadius.only(
          topLeft:const Radius.circular(25) ,
          topRight: const Radius.circular(25),
          bottomLeft: Radius.circular(
            index % 2==0 ?20:0
          ),
          bottomRight:Radius.circular(
              index % 2 != 0 ? 20:0),
        )
      ),
      child:  Column(
        children: [
          Image.asset( category.imagePath,
         height: MediaQuery.of(context).size.height*0.15, ),
          Text(category.title,style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.whiteColor,
            fontSize: 25
          ),),

        ],
      ),
    );
  }
}
