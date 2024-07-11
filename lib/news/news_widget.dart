import 'package:flutter/material.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/news_widget_View_Model.dart';
import 'package:provider/provider.dart';

import '../api/api_manager.dart';

// ignore: must_be_immutable
class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel=NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getNewsBySourceId(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>viewModel,
      child: Consumer<NewsWidgetViewModel>(builder: (BuildContext context, NewsWidgetViewModel value, Widget? child) {
           if (viewModel.errorMessage!=null){
             return  Column(
                          children: [
                             Text(viewModel.errorMessage!),
                            ElevatedButton(onPressed: (){
                             viewModel.getNewsBySourceId(widget.source.id??'');
                            }, child: const Text('Try Again'))
                          ],
                        );
           }
        if(viewModel.newsList==null){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.primaryLightColor,
            ),
          );
        }else{
          return ListView.builder(itemBuilder:(context,index){
                      return NewsItem(news:viewModel.newsList![index]);
                    },itemCount: viewModel.newsList!.length,);
                 }

      },

      )
      // FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceId(widget.source.id ??''),
      //     builder: (context,snapshot){
      //        if(snapshot.connectionState==ConnectionState.waiting){
      //          return Center(
      //            child: CircularProgressIndicator(
      //              backgroundColor:  MyTheme.primaryLightColor,
      //            ),
      //          );
      //        }else if(snapshot.hasError){
      //          return Column(
      //            children: [
      //              const Text('Something went wrong'),
      //              ElevatedButton(onPressed: (){
      //                ApiManager.getNewsBySourceId(widget.source.id??'');
      //                setState(() {
      //
      //                });
      //              }, child: const Text('Try Again'))
      //            ],
      //          );
      //        }
      //        //server (success ,error)
      //        if(snapshot.data?.status!='ok'){
      //          return Column(
      //            children: [
      //              Text(snapshot.data!.message!),
      //              ElevatedButton(onPressed: (){
      //                ApiManager.getNewsBySourceId(widget.source.id??'');
      //                setState(() {
      //
      //                });
      //              }, child: const Text('Try Again'))
      //            ],
      //          );
      //        }
      //       //data
      //        var newsList= snapshot.data?.articles??[];
      //        return ListView.builder(itemBuilder:(context,index){
      //          return NewsItem(news: newsList[index]);
      //        },itemCount: newsList.length,);
      //     }),
    );
  }
}
