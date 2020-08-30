import 'package:appnews/category_item.dart';
import 'package:appnews/models/ResponseNews.dart';
import 'package:appnews/models/category.dart';
import 'package:appnews/news_item.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  ResponseNews responseNews;
  List<Category> categories;

  NewsPage(this.responseNews,this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return CategoryItem(
                      categoryName: categories[index].categoryImage,
                      imageAssetUrl: categories[index].imageUrl,
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top:16),
              child: ListView.builder(
                  itemCount:responseNews.articles.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return NewsItem(
                      imgUrl: responseNews.articles[index].urlToImage ?? '',
                      title: responseNews.articles[index].title ?? '',
                      desc: responseNews.articles[index].description ?? '',
                      content: responseNews.articles[index].content ?? '',
                      postUrl: responseNews.articles[index].url ?? '',
                      name: responseNews.articles[index].source.name ?? '',
                    );
                  }
              )
            ),
          ],
        ),
      ),
    );
  }
}
