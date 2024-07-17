import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Theme_Data.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/news/cubit/news_widget_view_model.dart';
import 'package:news_app/news/cubit/states.dart';
import 'package:news_app/news/news_item.dart';


// ignore: must_be_immutable
class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(bloc: viewModel,
      builder: (context, state) {
       if(state is SourceLoadingState){
         return Center(
           child: CircularProgressIndicator(
             backgroundColor:  MyTheme.primaryLightColor,
           ),
         );
       }else if(state is SourceErrorMessage){
         return Column(
                      children: [
                         Text(state.errorMessage!),
                        ElevatedButton(onPressed: (){
                         viewModel.getNewsBySourceId(widget.source.id!);
                        }, child: const Text('Try Again'))
                      ],
                    );
       }else if(state is SourceSuccessMessage){
         return ListView.builder(itemBuilder:(context,index){
                  return NewsItem(news: state.newsList[index]);
                },itemCount:state.newsList.length,);
       }
       return Container();

    },);
         // FutureBuilder<NewsResponse?>(future: ApiManager.getNewsBySourceId(widget.source.id ??''),
      //   builder: (context,snapshot){
      //      if(snapshot.connectionState==ConnectionState.waiting){
      //        return Center(
      //          child: CircularProgressIndicator(
      //            backgroundColor:  MyTheme.primaryLightColor,
      //          ),
      //        );
      //      }else if(snapshot.hasError){
      //        return Column(
      //          children: [
      //            const Text('Something went wrong'),
      //            ElevatedButton(onPressed: (){
      //              ApiManager.getNewsBySourceId(widget.source.id??'');
      //              setState(() {
      //
      //              });
      //            }, child: const Text('Try Again'))
      //          ],
      //        );
      //      }
      //      //server (success ,error)
      //      if(snapshot.data?.status!='ok'){
      //        return Column(
      //          children: [
      //            Text(snapshot.data!.message!),
      //            ElevatedButton(onPressed: (){
      //              ApiManager.getNewsBySourceId(widget.source.id??'');
      //              setState(() {
      //
      //              });
      //            }, child: const Text('Try Again'))
      //          ],
      //        );
      //      }
      //     //data
      //      var newsList= snapshot.data?.articles??[];
      //      return ListView.builder(itemBuilder:(context,index){
      //        return NewsItem(news: newsList[index]);
      //      },itemCount: newsList.length,);
      //   });
  }
}
