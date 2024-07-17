 import 'package:news_app/model/NewsResponse.dart';
abstract class SourcesNewsStates{}///parents
 class SourceInitialState extends SourcesNewsStates{

 }
 class SourceLoadingState extends SourcesNewsStates{
  //todo: LoadingMessage
 }
 class SourceErrorMessage extends SourcesNewsStates{
  String? errorMessage;
  SourceErrorMessage({required this.errorMessage});
 }
 class SourceSuccessMessage extends SourcesNewsStates{
   List<News> newsList;
   SourceSuccessMessage({required this.newsList});
 }


