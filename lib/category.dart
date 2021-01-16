import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'news_app_route.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

final c_height=100.0;
final icon_size=60.0;
final icon_with_bgcolr_width=70.0;
final text_size=24.0;
final _borderRadius = BorderRadius.circular(c_height / 2);

class Category extends StatelessWidget{
  final String name;
  final IconData iconData;
  final ColorSwatch colorswatch;
  final String url_address;
  const Category({
    Key key,
    @required this.name, this.iconData, this.colorswatch, this.url_address,
  })  : assert(name != null),
        assert(colorswatch != null),
        assert(iconData != null),
        assert(url_address!=null),
        super(key: key);

  void _navigateTonewsapprouter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return News_item_route(name: name,url_add: url_address,clr: colorswatch);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(
      color: Colors.transparent,
      child: Container(
        height: c_height,
        child: InkWell(
          borderRadius: _borderRadius,
          splashColor: colorswatch,
          highlightColor: colorswatch,
          onTap: () => _navigateTonewsapprouter(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    iconData,size: icon_size,
                  )
                ),
                Center(
                  child: Text(name,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,)
                )
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}