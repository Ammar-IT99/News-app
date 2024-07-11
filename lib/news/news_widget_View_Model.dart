import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';

import '../model/NewsResponse.dart';
// ignore: must_be_immutable
class NewsWidgetViewModel extends ChangeNotifier{
  //todo: hold data - handel logic
  List<News>? newsList;
  String? errorMessage;
  void getNewsBySourceId(String sourceId)async{
    try{

   var response=await ApiManager.getNewsBySourceId(sourceId);
   if(response?.status=='error'){
     errorMessage=response!.message;
   }else{
     newsList=response!.articles;
   }
  }catch(e){
    errorMessage='Error Loading News List.';
    }
    notifyListeners();
}
}