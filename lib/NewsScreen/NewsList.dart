import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/modules/ArticlesResponse.dart';
import 'package:news/modules/NewsItem.dart';
import 'package:news/modules/sources.dart';
import 'package:http/http.dart' as http;
class NewsList extends StatefulWidget {
  Sources source;
  NewsList(this.source);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Future<ArticlesResponse>articleResponse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleResponse=loadArticles();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
     future: articleResponse,
      builder:(buildContext,snapshot){
      if (snapshot.hasError) {
        return Text(snapshot.hasError.toString());
      } else if (snapshot.hasData) {
        return ListView.builder(itemBuilder: (buildContext,index){
        return NewsItem(snapshot.data.articles[index]);},
        itemCount:snapshot.data.articles.length,


            );}
      else
        return    Center(child: CircularProgressIndicator());
    }

    );}

  Future<ArticlesResponse>loadArticles()async {

    Uri uri = Uri.https('newsapi.org', 'v2/everything',
        {'apiKey': '4c57af7bda314d87b0770e54e5675689',
          'sources': widget.source.id
        });
    final response = await http.get(uri);
    if (response.statusCode == 200)
      return ArticlesResponse.fromJsonMap(jsonDecode(response.body));
    else
      throw (Exception(response.body));
}
}

