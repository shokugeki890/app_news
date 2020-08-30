import 'package:appnews/helper/data_request.dart';
import 'package:appnews/helper/widget.dart';
import 'package:appnews/models/ResponseNews.dart';
import 'package:appnews/news_item.dart';
import 'package:flutter/material.dart';

class NewsByCategories extends StatefulWidget {

  final String newsCategory;

  NewsByCategories({this.newsCategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newsCategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {

  NewsByCategory newsByCategory = NewsByCategory();
  String newsCategory;

  _NewsByCategoriesState(this.newsCategory);

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: FutureBuilder(future: newsByCategory.getNewsByCategory(newsCategory),
        builder: (context, snapshot){
        if(snapshot.hasData){
          return ListNewsCategory(snapshot.data);
        }else if(snapshot.hasError){
          print(snapshot.error);
          return Center(child: Text('Data Not Found'));
        }
        return Center(
          child: CircularProgressIndicator(),
         );
        }
      ),
    );
  }
}

class ListNewsCategory extends StatelessWidget {

  ResponseNews responseNews;
  ListNewsCategory(this.responseNews);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
    );
  }
}

