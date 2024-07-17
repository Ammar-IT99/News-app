import '../../model/sourceResponse.dart';

abstract class SourcesStates{}///parents
class SourceInitialStates extends SourcesStates{}
class SourceLoadingStates extends SourcesStates{
  //todo: loading message
}
class SourceErrorStates extends SourcesStates{
  String? errorMessage;
  SourceErrorStates({required this.errorMessage});
}
class SourceSuccessStates extends SourcesStates{
  List<Source> sourcesList;
  SourceSuccessStates({required this.sourcesList});
}