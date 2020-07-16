import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemUserDetailsWidget extends StatelessWidget {
  final EmployeeProfileEntity user;
  final bool isPersonal;

  ItemUserDetailsWidget({@required this.user, @required this.isPersonal});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AtrakTheme.backgroundColor,
      child: Card(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        isPersonal ? 'First name' : 'Company name',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyColor,
                            ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        isPersonal ? 'Last name' : 'Joining date',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyColor,
                            ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        isPersonal ? 'Gender' : 'Department',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyColor,
                            ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        isPersonal ? 'Date of Birth' : 'Designation',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyColor,
                            ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      isPersonal
                          ? Text(
                              'Phone Number',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyColor,
                                  ),
                            )
                          : Container(),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            isPersonal ? user.firstName : user.companyName,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.darkGreyColor,
                                ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            isPersonal
                                ? user.lastName
                                : DateFormat("dd-MMM-yyyy")
                                    .format(user.joinDate),
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.darkGreyColor,
                                ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            isPersonal ? user.gender : user.department,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.darkGreyColor,
                                ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            isPersonal
                                ? DateFormat("dd-MMM-yyyy").format(user.dob)
                                : user.designation,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.darkGreyColor,
                                ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          isPersonal
                              ? Text(
                                  user.phone,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkGreyColor,
                                      ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
