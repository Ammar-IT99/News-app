
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Category/cubit/states.dart';
import 'package:news_app/api/api_manager.dart';

class CategoryDetailsViewModel extends Cubit<SourcesStates>{
  CategoryDetailsViewModel():super(SourceLoadingStates());

  //todo: handel logic- hold data
 void getSources(categoryId)async{
   try{
     emit(SourceLoadingStates());
     var response=await ApiManager.getSources(categoryId);
     if(response!.status=='error'){
       emit(SourceErrorStates(errorMessage:response.message ));
       return;
     }else{
       return emit(SourceSuccessStates(sourcesList: response.sources!));
     }
   }catch(e){
  emit(SourceErrorStates(errorMessage: 'Error Loading Sources List.'));
   }

 }
}