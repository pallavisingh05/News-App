import 'package:flutter/material.dart';

final category_color={
  "World": Colors.blueAccent,
  "Environment": Colors.tealAccent,

  "Science & Technology":Colors.pinkAccent,

  "Entertainment": Colors.lightGreenAccent,
  "Bussiness": Colors.yellowAccent,
  "Sports":Colors.red,
};

final category_icon={
  "World": Icons.add_location_sharp,
  "Environment": Icons.eco_sharp,

  "Science & Technology":Icons.engineering_sharp,

  "Entertainment": Icons.audiotrack_rounded,
  "Bussiness": Icons.business,
  "Sports":Icons.sports_basketball_sharp,
};

final category_url= {
  "World": 'https://newsapi.org/v2/top-headlines?sources=google&apiKey=9ce261e4efee47cea3956500b8049c9f',
  "Environment": 'https://newsapi.org/v2/top-headlines?sources=new-scientist&apiKey=9ce261e4efee47cea3956500b8049c9f',
  "Science & Technology":'https://newsapi.org/v2/top-headlines?sources=engadget&apiKey=9ce261e4efee47cea3956500b8049c9f',

  "Entertainment": 'https://newsapi.org/v2/top-headlines?sources=mtv-news&apiKey=9ce261e4efee47cea3956500b8049c9f',
  "Bussiness": 'https://newsapi.org/v2/top-headlines?sources=business-insider&apiKey=9ce261e4efee47cea3956500b8049c9f',
  "Sports":'https://newsapi.org/v2/top-headlines?sources=talksport&apiKey=9ce261e4efee47cea3956500b8049c9f',
};





