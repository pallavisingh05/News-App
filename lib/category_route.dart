import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'category.dart';

class Category_Route extends StatefulWidget{
  Category_Route();

  @override
  category_route createState() => category_route();
}

class category_route extends State<Category_Route>{
  category_route();

  static const categories_name=<String>[
    'World',
    'Environment',
    'Science & Technology',
    'Entertainment',
    'Bussiness',
    'Sports'
  ];

  static const icons_img=<IconData>[
    Icons.add_location_sharp,
    Icons.eco_sharp,
    Icons.engineering_sharp,
    Icons.audiotrack_rounded,
    Icons.business,
    Icons.sports_basketball_sharp,
  ];

  static const category_colors=<ColorSwatch>[
    Colors.blueAccent,
    Colors.tealAccent,
    Colors.pinkAccent,
    Colors.lightGreenAccent,
    Colors.yellowAccent,
    Colors.red,
  ];

  static const category_url=<String>[
    'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=9ce261e4efee47cea3956500b8049c9f',
    'https://newsapi.org/v2/top-headlines?sources=new-scientist&apiKey=9ce261e4efee47cea3956500b8049c9f',
    'https://newsapi.org/v2/top-headlines?sources=engadget&apiKey=9ce261e4efee47cea3956500b8049c9f',
    'https://newsapi.org/v2/top-headlines?sources=mtv-news&apiKey=9ce261e4efee47cea3956500b8049c9f',
    'https://newsapi.org/v2/top-headlines?sources=business-insider&apiKey=9ce261e4efee47cea3956500b8049c9f',
    'https://newsapi.org/v2/top-headlines?sources=talksport&apiKey=9ce261e4efee47cea3956500b8049c9f',
  ];

  final category_list=<Category>[];

  @override
  void initState(){
    for(int i=0;i<categories_name.length;i++){
      category_list.add(Category(
        name: categories_name[i],
        iconData: icons_img[i],
        colorswatch: category_colors[i],
        url_address: category_url[i],
      ));
    }
  }

  Widget CategoryList(List<Widget> category_list){
    if(MediaQuery.of(context).orientation == Orientation.portrait ) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => category_list[index],
        itemCount: category_list.length,
      );
    }else{
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: category_list,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final listview=Container(
      color: Colors.greenAccent,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: CategoryList(category_list),
    );

    final appbar= AppBar(
      backgroundColor: Colors.greenAccent,
      title: Center(
        child: Text('News Today: Categories',textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline,),
        )
    );

    final weather_button=
    Container(
    height: 80.0,
    width: 80.0,
    child: FloatingActionButton(
      onPressed: () {
      print('I was tapped!');
      },
      child: Icon(Icons.wb_sunny,
      color: Colors.black,
      size: 65.0,
      ),
      backgroundColor: Colors.greenAccent,
      splashColor: Colors.yellowAccent,
    ),
    );


    return Scaffold(
        appBar: appbar,
        body: listview,
        floatingActionButton: weather_button,
    );

  }
}