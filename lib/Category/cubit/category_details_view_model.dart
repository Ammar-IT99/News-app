
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Category/cubit/states.dart';
import 'package:news_app/repository%20source/data_source/source_remote_data_source_impl.dart';
import 'package:news_app/repository%20source/repository/source_repository_impl.dart';


import '../../api/api_manager.dart';
import '../../repository source/source_repository_contract.dart';

class CategoryDetailsViewModel extends Cubit<SourcesStates>{
 late SourceRemoteDataSource remoteDataSource;
 late SourceRepositoryContract repositoryContract;
  late   ApiManager apiManager;
  CategoryDetailsViewModel():super(SourceLoadingStates()){
    apiManager= ApiManager();
    remoteDataSource=SourceRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract= SourceRepositoryImpl(remoteDataSource: remoteDataSource);
}

  //todo: handel logic- hold data
 void getSources(categoryId)async{
   try{
     emit(SourceLoadingStates());
     var response=await repositoryContract.getSources(categoryId);
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