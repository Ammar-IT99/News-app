import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/sourceResponse.dart';
class ApiManager{
 // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 // -----------------------------------------------------------
 // a4d63d05ba5f4d2585aea7f6ea32a701
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url= Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {
      'apiKey' :'a4d63d05ba5f4d2585aea7f6ea32a701',
      'category': categoryId
    });
    try{
      var response= await http.get(url);
      response.body;
      var responsebody=response.body; //String
      var json=jsonDecode(responsebody); // String =>json
      return SourceResponse.fromJson(json); //object => json
    }catch(e){
      rethrow;
    }

  }


  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=a4d63d05ba5f4d2585aea7f6ea32a701
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
       Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
       {
         'apiKey':'a4d63d05ba5f4d2585aea7f6ea32a701',
         'sources': sourceId
       });
       try{
         var response =await http.get(url);
         var responseBody =response.body;//string
         var json= jsonDecode(responseBody);
         return NewsResponse.fromJson(json);
       }catch(e){
         rethrow;
       }

  }
}