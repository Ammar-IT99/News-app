import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';

class HomeDrawer extends StatelessWidget {
 static const int categories=1;
 static const int settings=2;
Function onSideMenuItemClick;
HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width:double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.10),
            color: MyTheme.primaryLightColor,
            child: Text('News App!',
              style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
           onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                const Icon(Icons.list,
                size: 30,),
                Text('Categories',
                  style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: () {
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                const Icon(Icons.settings,
                  size: 30,),
                Text('Settings',
                  style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Stack(
// children:[
// Scaffold(
// appBar: AppBar(
//
// title: Text('News App!'),
//
// ),
// body: const Column(
// children: [
// Row(children: [
// Icon(Icons.list_outlined),
// Text('Categories')
// ],)
// ],
// ),
// )
// ]
// );