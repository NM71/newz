import 'dart:convert';

import 'package:newz/models/show_category.dart';
import 'package:newz/models/slider_model.dart';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;


class ShowCategoryNews{

  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category)async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=961e4cc1d515499c874dcc9ee2305c96";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}