import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/repository%20source/source_repository_contract.dart';

 class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
   ApiManager apiManager;
   SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
       var response=await   apiManager.getSources(categoryId);
       return response;
  }

}