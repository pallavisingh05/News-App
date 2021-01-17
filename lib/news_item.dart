import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/news_app_route.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

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
  ColorSwatch bgcolor;
  News_Item({Key key,this.news_item,this.bgcolor})
      :assert(news_item!=null),
        assert(bgcolor!=null),
        super(key: key);

  void _launchURL(BuildContext context) async {
    try {
      await launch(
        news_item.url,
        option: new CustomTabsOption(
          toolbarColor: bgcolor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn()

      ),
    );
    } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 400.0,
        child: InkWell(
          splashColor: bgcolor,
          highlightColor: bgcolor,
          onTap: ()=> _launchURL(context),
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
                    Text(news_item.content!=null?news_item.content.substring(0,50)+'....Tap to know more.':'',style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
