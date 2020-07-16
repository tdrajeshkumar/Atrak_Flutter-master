import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageLeavesRequest extends StatefulWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final void Function(String) showMessage;

  PageLeavesRequest({@required this.showMessage});

  @override
  _PageLeavesRequestState createState() => _PageLeavesRequestState();
}

class _PageLeavesRequestState extends State<PageLeavesRequest> {
  int _fromDateSelectedItem, _toDateSelectedItem;

  final _fromDateController = TextEditingController(text: "");
  final _toDateController = TextEditingController(text: "");
  final _totalDaysController = TextEditingController();
  final _reasonController = TextEditingController();
  final _contactNoController = TextEditingController();

  final _reasonFocus = FocusNode();
  final _contactNoFocus = FocusNode();

  final selectedDateFormat = DateFormat("dd-MM-yyy");
  DateTime _currentDate;

  void _submit() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (widget._formKey.currentState.validate()) {
      widget.showMessage("Your leave request sent");
    }
  }

  Future _showFromDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      firstDate: _currentDate,
      lastDate: DateTime.now().add(Duration(days: 30)),
      initialDate: _fromDateController.text.isEmpty
          ? _currentDate
          : selectedDateFormat.parse(_fromDateController.text),
    );
    if (selectedDate != null) {
      _fromDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      _toDateController.text = "";
      AtrakKeys.fromDateFieldKey.currentState.validate();
    }
  }

  Future _showToDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: _toDateController.text.isEmpty
            ? selectedDateFormat.parse(_fromDateController.text)
            : selectedDateFormat.parse(_toDateController.text),
        firstDate: selectedDateFormat.parse(_fromDateController.text),
        lastDate: selectedDateFormat
            .parse(_fromDateController.text)
            .add(Duration(days: 30)));
    if (selectedDate != null) {
      _toDateController.text = selectedDateFormat.format(selectedDate);
      _totalDaysController.text = selectedDateFormat
          .parse(_toDateController.text)
          .difference(selectedDateFormat.parse(_fromDateController.text))
          .inDays
          .toString();
      AtrakKeys.toDateFieldKey.currentState.validate();
    }
  }

  void _fromDateSelectorChanged(int value) =>
      setState(() => _fromDateSelectedItem = value);

  void _toDateSelectorChanged(int value) =>
      setState(() => _toDateSelectedItem = value);

  @override
  void initState() {
    super.initState();
    _fromDateSelectedItem = 0;
    _toDateSelectedItem = 0;
    _currentDate =
        selectedDateFormat.parse(selectedDateFormat.format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _showFromDatePicker();
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      key: AtrakKeys.fromDateFieldKey,
                      controller: _fromDateController,
                      style: Theme.of(context).textTheme.subtitle,
                      validator: (val) {
                        if (val.isEmpty && _toDateController.text.isEmpty) {
                          return AtrakLocalizations.of(context)
                              .selectFromDateErrorMessage;
                        }
                        return FormUtils.validate(value: val, type: TYPES.date);
                      },
                      decoration: InputDecoration(
                        labelText: AtrakLocalizations.of(context).fromDate,
                        hintText: AtrakLocalizations.of(context).fromDate,
                        hintStyle: AtrakTheme.formFieldStyle,
                        suffixIcon: Image.asset(
                          UrlPaths.calendarImage,
                          scale: 1.5,
                          color: AtrakTheme.greyColor,
                        ),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: AtrakTheme.greyColor)),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 0,
                        groupValue: _fromDateSelectedItem,
                        onChanged: _fromDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).fullDay,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 1,
                        groupValue: _fromDateSelectedItem,
                        onChanged: _fromDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).firstHalf,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 2,
                        groupValue: _fromDateSelectedItem,
                        onChanged: _fromDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).secondHalf,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    print("You Tapped");
                    if (AtrakKeys.fromDateFieldKey.currentState.validate()) {
                      _showToDatePicker();
                    }
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      key: AtrakKeys.toDateFieldKey,
                      controller: _toDateController,
                      validator: (val) =>
                          FormUtils.validate(value: val, type: TYPES.date),
                      decoration: InputDecoration(
                        labelText: AtrakLocalizations.of(context).toDate,
                        hintText: AtrakLocalizations.of(context).toDate,
                        hintStyle: AtrakTheme.formFieldStyle,
                        suffixIcon: Image.asset(
                          UrlPaths.calendarImage,
                          scale: 1.5,
                          color: AtrakTheme.greyColor,
                        ),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: AtrakTheme.greyColor)),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 0,
                        groupValue: _toDateSelectedItem,
                        onChanged: _toDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).fullDay,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 1,
                        groupValue: _toDateSelectedItem,
                        onChanged: _toDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).firstHalf,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 2,
                        groupValue: _toDateSelectedItem,
                        onChanged: _toDateSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).secondHalf,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: _totalDaysController,
                          decoration: InputDecoration(
                            labelText: AtrakLocalizations.of(context).totalDays,
                            hintText: AtrakLocalizations.of(context).totalDays,
                            hintStyle: AtrakTheme.formFieldStyle,
                            border: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AtrakTheme.greyColor)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Casual Leave",
                              style: AtrakTheme.formFieldStyle,
                            ),
                          ),
                        ],
                        hint: Text(AtrakLocalizations.of(context).leaveType),
                        decoration: InputDecoration(
                          hintStyle: AtrakTheme.formFieldStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  controller: _reasonController,
                  focusNode: _reasonFocus,
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    _reasonFocus.unfocus();
                    FocusScope.of(context).requestFocus(_contactNoFocus);
                  },
                  decoration: InputDecoration(
                    labelText: AtrakLocalizations.of(context).reason,
                    hintText: AtrakLocalizations.of(context).reason,
                    hintStyle: AtrakTheme.formFieldStyle,
                    border: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: AtrakTheme.greyColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: AtrakTheme.greyColor)),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  controller: _contactNoController,
                  focusNode: _contactNoFocus,
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  onFieldSubmitted: (_) {
                    _contactNoFocus.unfocus();
                    _submit();
                  },
                  decoration: InputDecoration(
                    labelText: AtrakLocalizations.of(context).contactNo,
                    hintText: AtrakLocalizations.of(context).contactNo,
                    hintStyle: AtrakTheme.formFieldStyle,
                    border: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: AtrakTheme.greyColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: AtrakTheme.greyColor)),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: _submit,
                      child: new Text(
                        AtrakLocalizations.of(context).submit,
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ]),
    );
  }

  @override
  void dispose() {

    _totalDaysController.dispose();
    _reasonController.dispose();
    _contactNoController.dispose();
    super.dispose();
  }
}
