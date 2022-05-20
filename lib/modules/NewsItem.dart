import 'package:flutter/cupertino.dart';
import 'package:news/modules/articles.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12,),
          Image.network(article.urlToImage),
          SizedBox(height: 8,),
          Text(article.source.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff79828B)),textAlign: TextAlign.start,),
          SizedBox(height: 8,),
          Text(article.title,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: Color(0xff79828B)),textAlign: TextAlign.start, ),
          Text(article.publishedAt,style:  TextStyle(fontSize: 13,color: Color(0xff79828B)),textAlign: TextAlign.end,),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}
