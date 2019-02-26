library day_selector;

import 'package:flutter/material.dart';

class DaySelector extends StatefulWidget {
  static const modeFull = monday | tuesday | wednesday | thursday | friday | saturday | sunday;
  static const modeWorkdays = monday | tuesday | wednesday | thursday | friday | saturday;
  static const monday = 2;
  static const tuesday = 4;
  static const wednesday = 8;
  static const thursday = 16;
  static const friday = 32;
  static const saturday = 64;
  static const sunday = 128;
  final int mode;
  final Color color;
  final Function(int) onChange;

  const DaySelector({Key key, this.mode = modeWorkdays, this.onChange, this.color}) : super(key: key);

  @override
  DaySelectorState createState() {
    return DaySelectorState();
  }
}

class DaySelectorState extends State<DaySelector> {
  var selectedDays = 1;

  bool _isDayAllowed(int day) {
    return widget.mode & day == day;
  }

  @override
  Widget build(BuildContext context) {
    final days = <Widget>[];
    final labels = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    final values = [
      DaySelector.monday,
      DaySelector.tuesday,
      DaySelector.wednesday,
      DaySelector.thursday,
      DaySelector.friday,
      DaySelector.saturday,
      DaySelector.sunday,
    ];

    _Day _getDay(int index) => _Day(
          color: widget.color,
          label: labels[index],
          selected: selectedDays & values[index] == values[index],
          value: values[index],
          onTap: (value) {
            setState(() {
              if (selectedDays & value == value) {
                selectedDays &= ~value;
              } else {
                selectedDays |= value;
              }
              if (widget.onChange != null) {
                widget.onChange(selectedDays);
              }
            });
          },
        );

    if (_isDayAllowed(DaySelector.monday)) {
      days.add(_getDay(0));
    }
    if (_isDayAllowed(DaySelector.tuesday)) {
      days.add(_getDay(1));
    }
    if (_isDayAllowed(DaySelector.wednesday)) {
      days.add(_getDay(2));
    }
    if (_isDayAllowed(DaySelector.thursday)) {
      days.add(_getDay(3));
    }
    if (_isDayAllowed(DaySelector.friday)) {
      days.add(_getDay(4));
    }
    if (_isDayAllowed(DaySelector.saturday)) {
      days.add(_getDay(5));
    }
    if (_isDayAllowed(DaySelector.sunday)) {
      days.add(_getDay(6));
    }

    return Row(
      children: days,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}

class _Day extends StatelessWidget {
  final Color color;
  final bool selected;
  final String label;
  final int value;
  final Function(int) onTap;

  const _Day({Key key, this.color, this.label, this.selected = false, this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    var borderColor = Colors.black;
    if (ThemeData.estimateBrightnessForColor(color ?? buttonTheme.colorScheme.background) == Brightness.dark) {
      borderColor = Theme.of(context).accentColor;
    }
    return RawMaterialButton(
      onPressed: () {
        onTap(value);
      },
      elevation: selected ? 4 : 2,
      constraints: BoxConstraints(minWidth: 40, minHeight: 40),
      fillColor: color ?? buttonTheme.colorScheme.background,
      textStyle: Theme.of(context).textTheme.button,
      child: Text(label, style: TextStyle(color: borderColor)),
      shape: CircleBorder(side: selected ? BorderSide(color: borderColor, width: 1) : BorderSide.none),
    );
  }
}
