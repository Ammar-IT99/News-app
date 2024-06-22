
import 'package:flutter/material.dart';
import 'package:news_app/Category/category_Fragment.dart';
import 'package:news_app/Category/category_details.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/drawer/Home_Drawer.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/settings_tab/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuItem==HomeDrawer.settings?
                  'Setting':
                  selectedCategory==null?
              'News app':
                      selectedCategory!.id
              ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
       drawer:  Drawer(

         child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
       ),
       body: selectedMenuItem==HomeDrawer.settings?
            const Settings():selectedCategory==null?
       CategoryFragment(
         onCategoryClick: onCategoryClick,
         ):CategoryDetails(category: selectedCategory!,),
        )

      ],
    );
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory){
     //todo: newSelectedCategory=> user
    selectedCategory=newSelectedCategory;
    setState(() {

    });

  }
  int selectedMenuItem=HomeDrawer.categories;
  void onSideMenuItemClick(int newSelectedMenuItem){
    selectedMenuItem=newSelectedMenuItem;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
