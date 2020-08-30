import 'package:appnews/helper/data_category.dart';
import 'package:appnews/helper/data_request.dart';
import 'package:appnews/helper/widget.dart';
import 'package:appnews/models/category.dart';
import 'package:appnews/news_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: myAppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context,snapshot){
            //jika API nya mempunyai data
            if (snapshot.hasData){
              return NewsPage(snapshot.data,categories);
            }//jika API nya gagal/error
            else if(snapshot.hasError){
              return Center(child: Text('Data Not Found'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
