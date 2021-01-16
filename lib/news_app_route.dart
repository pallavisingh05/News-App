import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_item.dart';
import 'dart:convert';

class News_item_route extends StatefulWidget{

  final String url_add;
  final String name;
  final ColorSwatch clr;
  News_item_route({Key key,@required this.name,@required this.url_add,@required this.clr})
      : assert(url_add != null),
        assert(name!=null),
        assert(clr!=null),
        super(key: key);


  @override
  news_item_route createState() => news_item_route(name,url_add,clr);
}

class news_item_route extends State<News_item_route>{
  String url_add;
  String name;
  ColorSwatch clr;
  news_item_route(this.name,this.url_add,this.clr);


  Future<List<Article>> fetchAlbum() async {
    var response = await http.get(Uri.encodeFull(url_add),headers: {"Accept":"application/json"});
    if (response.statusCode == 200) {
      var res_data=json.decode(response.body);
      var rans_list_json=res_data["articles"] as List;
      print(rans_list_json);
      return rans_list_json.map<Article>((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Article>> futArticle;

  @override
  void initState(){
    super.initState();
    futArticle=fetchAlbum();
  }

  Widget news_item_list(List<Article> news_list){
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => News_Item(news_item: news_list[index],bgcolor: clr),
        itemCount:(news_list.length>=10?10:news_list.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final body_dis=FutureBuilder(
        future: futArticle,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? news_item_list(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });

    final appbar= AppBar(
        backgroundColor: clr,
        title: Text(name,textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline,),
    );

    return Scaffold(
      appBar: appbar,
      body: body_dis,
    );
    // throw UnimplementedError();
  }

}