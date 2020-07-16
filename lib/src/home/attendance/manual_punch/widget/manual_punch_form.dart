import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/url_paths.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManualPunchForm extends StatefulWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final void Function(String) showMessage;

  ManualPunchForm({@required this.showMessage});

  @override
  _ManualPunchFormState createState() => _ManualPunchFormState();
}

class _ManualPunchFormState extends State<ManualPunchForm> {
  int _dateSelectedItem, _onDutyTypeSelectedItem;

  final _dateFieldKey = GlobalKey<FormFieldState>();
  final _fromTimeFieldKey = GlobalKey<FormFieldState>();
  final _toTimeFieldKey = GlobalKey<FormFieldState>();

  final _dateController = TextEditingController(text: "");
  final _fromTimeController = TextEditingController(text: "");
  final _toTimeController = TextEditingController(text: "");
  final _reasonController = TextEditingController();

  final _reasonFocus = FocusNode();

  final selectedDateFormat = DateFormat("dd-MM-yyy");
  DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _dateSelectedItem = 0;
    _onDutyTypeSelectedItem = 0;
    _currentDate =
        selectedDateFormat.parse(selectedDateFormat.format(DateTime.now()));
  }

  Future _showDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      firstDate: _currentDate,
      lastDate: DateTime.now().add(Duration(days: 30)),
      initialDate: _dateController.text.isEmpty
          ? _currentDate
          : selectedDateFormat.parse(_dateController.text),
    );
    if (selectedDate != null) {
      _dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  void _dateSelectorChanged(int value) =>
      setState(() => _dateSelectedItem = value);

  void _onDutyTypeSelectorChanged(int value) =>
      setState(() => _onDutyTypeSelectedItem = value);

  void _submit() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (widget._formKey.currentState.validate()) {
      widget.showMessage("Your Manual Punch request sent");
    }
  }

  Future _showFromTimePicker() async {
    final TimeOfDay selectedTime =
        await showTimePicker(initialTime: TimeOfDay.now(), context: context);
    if (selectedTime != null) {
      _fromTimeController.text = selectedTime.format(context);
    }
  }

  Future _showToTimePicker() async {
    final TimeOfDay selectedTime =
        await showTimePicker(initialTime: TimeOfDay.now(), context: context);
    if (selectedTime != null) {
      _toTimeController.text = selectedTime.format(context);
    }
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
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              AtrakLocalizations.of(context).staffName,
                              style: AtrakTheme.formFieldStyle,
                            ),
                          ),
                        ],
                        hint: Text(AtrakLocalizations.of(context).staffName),
                        decoration: InputDecoration(
                          hintStyle: AtrakTheme.formFieldStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  AtrakLocalizations.of(context).selectPunch,
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontSize: 16.0, color: AtrakTheme.greyColor),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 0,
                        groupValue: _onDutyTypeSelectedItem,
                        onChanged: _onDutyTypeSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).inLabel,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 1,
                        groupValue: _onDutyTypeSelectedItem,
                        onChanged: _onDutyTypeSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).outLabel,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Radio(
                        activeColor: AtrakTheme.textIndicatorColor,
                        value: 2,
                        groupValue: _onDutyTypeSelectedItem,
                        onChanged: _onDutyTypeSelectorChanged,
                      ),
                      Text(
                        AtrakLocalizations.of(context).inOutLabel,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(width: 80.0),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    print("You Tapped");
                    _showFromTimePicker();
                    // if (_fromDateFieldKey.currentState.validate()) {
                    //   _showToDatePicker();
                    // }
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      key: _fromTimeFieldKey,
                      controller: _fromTimeController,
                      // validator: (val) =>
                      //     FormUtils.validate(value: val, type: TYPES.date),
                      decoration: InputDecoration(
                        labelText: AtrakLocalizations.of(context).timeLabel,
                        hintText: AtrakLocalizations.of(context).timeLabel,
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
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _reasonController,
                  focusNode: _reasonFocus,
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    _reasonFocus.unfocus();
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
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fromTimeController.dispose();
    _dateController.dispose();
    _toTimeController.dispose();
    _reasonController.dispose();
    super.dispose();
  }
}
