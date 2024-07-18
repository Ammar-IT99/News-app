import 'package:news_app/model/sourceResponse.dart';

abstract class SourceRepositoryContract{
  Future<SourceResponse?> getSources(String categoryId);

}
abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSources(String categoryId);
}
abstract class SourceLocalDatSource{}

abstract class SourceCachingDatSource{}