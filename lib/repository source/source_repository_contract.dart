import 'package:news_app/model/sourceResponse.dart';

abstract class SourceRepositoryContract{
  Future<SourceResponse?> getSources(String categoryId);

}