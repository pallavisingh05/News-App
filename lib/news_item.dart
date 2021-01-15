import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/news_app_route.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"]);
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}

class News_Item extends StatelessWidget {
  Article news_item;
  News_Item({Key key,this.news_item})
      :assert(news_item!=null),
        super(key: key);

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 350.0,
        child: InkWell(
          splashColor: Colors.lightGreenAccent,
          highlightColor: Colors.lightGreenAccent,
          onTap: (){
            print('I am tapped!');
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 200.0,
                      child: Image.network(news_item.urlToImage,height: 200.0,),
                    )
                ),
                    Text(news_item.title,textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline,),
                    Text(news_item.content.substring(0,50)+'....Tap to know more.',style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
