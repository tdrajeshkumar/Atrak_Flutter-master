import 'package:flutter/material.dart';

class ItemRequestsDashboard extends StatelessWidget {
  final String action;
  final String image;
  const ItemRequestsDashboard({Key key, @required this.action, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.41,
      child: Card(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  /*decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      gradient: LinearGradient(colors: [
                        AtrakTheme.gradientStartColor,
                        AtrakTheme.gradientEndColor
                      ])),*/
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(image,width: 25.0, height: 25.0,),
                  ),
                ),
                Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                        child: Text(action,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
