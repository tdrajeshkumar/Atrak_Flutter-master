import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String id;

  ProfileDetailsWidget({
    @required this.name,
    @required this.imageUrl,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
            ),
          ),
          Text(
            '$name',
            style: Theme.of(context).textTheme.title.copyWith(
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                  color: AtrakTheme.darkGreyColor,
                ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Staff ID $id',
            style: Theme.of(context).textTheme.body2.copyWith(
                  fontFamily: 'Work Sans',
                  color: AtrakTheme.greyColor,
                ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
