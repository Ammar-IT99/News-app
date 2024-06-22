
import 'package:flutter/material.dart';
import 'package:news_app/Category/tabs_widget.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/model/sourceResponse.dart';

import '../Theme_Data.dart';

class CategoryDetails extends StatefulWidget{

  static const String routeName='CategoryDetails';
  CategoryDM category;
 CategoryDetails({super.key, required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<SourceResponse?>
            (future: ApiManager.getSources(widget.category.id),
              builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.primaryLightColor,
                  ),
                );

              }else if(snapshot.hasError){
                return Column(
                  children: [
                    const Text('Something went wrong'),
                    ElevatedButton(onPressed: (){
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                    }, child: const Text('Try Again'))
                  ],
                );
              }
              //server (success ,error)
                if(snapshot.data?.status!='ok'){
                  return Column(
                    children: [
                       Text(snapshot.data?.message ?? 'Something went wrong'),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                      }, child: const Text('Try Again'))
                    ],
                  );
                }
                //success
              var sourcesList= snapshot.data?.sources??[];
                return TabsWidget(sourecesList:sourcesList);
              },

        );

  }
}