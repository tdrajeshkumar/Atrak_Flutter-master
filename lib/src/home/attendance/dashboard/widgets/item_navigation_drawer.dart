import 'package:flutter/material.dart';

class ItemNavigationDrawer extends StatelessWidget {

  final String imageUrl;
  final String title;
  final double width;
  final double height;

  const ItemNavigationDrawer({Key key, this.imageUrl, this.title, this.width = 22.0, this.height = 22.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          Container( width: this.width, height: this.height, child: Image.asset(imageUrl)),
          SizedBox(width: 20.0-(width-22),),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
