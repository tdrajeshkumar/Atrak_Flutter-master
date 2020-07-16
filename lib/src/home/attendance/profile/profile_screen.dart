import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/profile/profile.dart';
import 'package:atrak/src/home/attendance/profile/profile_bloc.dart';
import 'package:atrak/src/home/attendance/profile/widget/item_request_profile_details.dart';
import 'package:atrak/src/home/attendance/profile/widget/item_user_details_widget.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const ProfileScreen(this.attendanceBloc, {Key key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  ProfileBloc _bloc;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProfileBloc(Injector.of(context).repository);
    _bloc.getUserProfile();
    return BlocBuilder<ProfileEvent, ProfileState>(
        bloc: _bloc,
        builder: (context, profileState) {
          return profileState.isLoading
              ? CircularProgressIndicator()
              : Scaffold(
                  appBar: AttendanceAppBar(
                      AtrakLocalizations.of(context).profile,
                      widget.attendanceBloc.showDashboard),
                  body: profileState.user == null
                      ? CircularProgressIndicator()
                      : Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              ProfileDetailsWidget(
                                name:
                                    '${profileState.user.firstName} ${profileState.user.lastName}',
                                id: '${profileState.user.id}',
                                imageUrl: '${profileState.user.img}',
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TabBar(
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(fontSize: 16),
                                labelColor: AtrakTheme.darkGreyColor,
                                indicatorWeight: 3.0,
                                indicatorColor: AtrakTheme.textIndicatorColor,
                                tabs: [
                                  Tab(
                                      text: AtrakLocalizations.of(context)
                                          .personalDetails),
                                  Tab(
                                      text: AtrakLocalizations.of(context)
                                          .companyDetails),
                                ],
                                controller: _tabController,
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    ItemUserDetailsWidget(
                                      isPersonal: true,
                                      user: profileState.user,
                                    ),
                                    ItemUserDetailsWidget(
                                      isPersonal: false,
                                      user: profileState.user,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                );
        });
  }
}
