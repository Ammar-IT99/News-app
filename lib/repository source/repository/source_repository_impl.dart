import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/repository%20source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
 SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId){
    return remoteDataSource.getSources(categoryId);

  }

}