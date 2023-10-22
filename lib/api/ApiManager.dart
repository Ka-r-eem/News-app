import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String ApiKey = "67f5e52cf82641059ae08158cf7d725b";

  static Future<SourcesResponse> getSources(String categoryId) async {
    //apiKey=API_KEY
    var uri = Uri.https(baseUrl, "v2/top-headlines/sources", {
      "apiKey": ApiKey,
      "category": categoryId,
    });

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }


  static Future<NewsResponse> getNews(String? searched , String? sourceId)async{
    var url = Uri.https(baseUrl,"v2/everything",{
      "apiKey":ApiKey,
      "sources":sourceId,
      "q" : searched

    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }


  // static Future<SearchResponse> getSearch ( , String? sourceId)async{
  //   var url = Uri.https(baseUrl ,"v2/everything" , {
  //     "apiKey":ApiKey,
  //     "sources":sourceId,
  //   });
  //   var result = await http.get(url);
  //   var json = jsonDecode(result.body);
  //   var searchResponse = SearchResponse.fromJson(json);
  //   return searchResponse;

    
    
  }

