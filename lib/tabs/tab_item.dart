import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/model/sourceResponse.dart';
//ignore: must_be_immutable
class TabItem extends StatelessWidget {
  Source source;
bool isSelected ;
TabItem({super.key, required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.symmetric(vertical:4,horizontal: 4 ),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryLightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: MyTheme.primaryLightColor
        ),

      ),
      child: Text(source.name ??'',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected? MyTheme.whiteColor:MyTheme.primaryLightColor,
        fontSize: 18
      ),),
    );
  }
}
