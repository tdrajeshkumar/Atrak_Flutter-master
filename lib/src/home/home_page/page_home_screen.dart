import 'package:atrak/src/home/home_bloc.dart';
import 'package:atrak/src/home/widgets/item_home_section_widget.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class PageHomeScreen extends StatefulWidget {
  final HomeBloc bloc;

  PageHomeScreen(this.bloc);

  @override
  _PageHomeScreenState createState() => _PageHomeScreenState();
}

class _PageHomeScreenState extends State<PageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          AtrakLocalizations.of(context).logoText,
          style: Theme.of(context).textTheme.display3.copyWith(
              color: AtrakTheme.greyColor,
              fontWeight: FontWeight.w700,
              fontSize: Theme.of(context).textTheme.headline.fontSize),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AtrakTheme.greyColor,
          ),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     color: Colors.black,
        //     icon: Icon(Icons.more_vert),
        //     tooltip: 'Air it',
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              children: <Widget>[
                HomeSectionWidget(
                  imgUrl: 'assets/images/attendance.png',
                  title: 'Attendance',
                  isWhiteCard: true,
                  isActive: true,
                  page: widget.bloc.showAttendance,
                ),
                HomeSectionWidget(
                  imgUrl: 'assets/images/my_pay.png',
                  title: 'My Pay',
                  isWhiteCard: false,
                ),
                HomeSectionWidget(
                  imgUrl: 'assets/images/canteen.png',
                  title: 'Canteen',
                  isWhiteCard: false,
                ),
                HomeSectionWidget(
                  imgUrl: 'assets/images/transport.png',
                  title: 'Transport',
                  isWhiteCard: true,
                ),
                HomeSectionWidget(
                  imgUrl: 'assets/images/qms.png',
                  title: 'QMS',
                  isWhiteCard: true,
                ),
                HomeSectionWidget(
                  imgUrl: 'assets/images/visitor.png',
                  title: 'Visitor',
                  isWhiteCard: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
