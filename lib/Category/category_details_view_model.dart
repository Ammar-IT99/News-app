import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_manager.dart';

import '../model/sourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  //todo : hold data- handle logic

  List<Source>? sourcesList;
  String? errorMessage;
   void getSources(String categoryId)async {
     sourcesList=null;
     errorMessage=null;
     notifyListeners();
     try {
       var response =await ApiManager.getSources(categoryId);
     if(response?.status=='error') {
      errorMessage=response?.message;
     }else{
       sourcesList=response?.sources;
     }
       sourcesList= response?.sources;
     }catch(e){
errorMessage='Error Loading sources List.';
     }
     notifyListeners();
   }
}