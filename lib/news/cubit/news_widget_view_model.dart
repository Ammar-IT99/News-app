import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/news/cubit/states.dart';

class NewsWidgetViewModel extends Cubit<SourcesNewsStates>{
  NewsWidgetViewModel():super(SourceLoadingState());
//todo: handel logic- hold data
  void getNewsBySourceId(String sourceId)async{
    try{
      emit(SourceLoadingState());
      var response=await ApiManager.getNewsBySourceId(sourceId);
      if(response!.status=='error'){
        emit(SourceErrorMessage(errorMessage: response.message));
        return ;
      }else if(response.status=='ok'){
        emit(SourceSuccessMessage(newsList:response.articles!));
        return;
      }
    }catch(e){
    emit(SourceErrorMessage(errorMessage: 'Error News Loading List.'));
    }
  }

}