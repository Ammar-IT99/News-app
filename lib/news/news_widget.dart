import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/news/news_item.dart';


// ignore: must_be_immutable
class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceId(widget.source.id ??''),
        builder: (context,snapshot){
           if(snapshot.connectionState==ConnectionState.waiting){
             return Center(
               child: CircularProgressIndicator(
                 backgroundColor:  MyTheme.primaryLightColor,
               ),
             );
           }else if(snapshot.hasError){
             return Column(
               children: [
                 const Text('Something went wrong'),
                 ElevatedButton(onPressed: (){
                   ApiManager.getNewsBySourceId(widget.source.id??'');
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
                 Text(snapshot.data!.message!),
                 ElevatedButton(onPressed: (){
                   ApiManager.getNewsBySourceId(widget.source.id??'');
                   setState(() {

                   });
                 }, child: const Text('Try Again'))
               ],
             );
           }
          //data
           var newsList= snapshot.data?.articles??[];
           return ListView.builder(itemBuilder:(context,index){
             return NewsItem(news: newsList[index]);
           },itemCount: newsList.length,);
        });
  }
}
