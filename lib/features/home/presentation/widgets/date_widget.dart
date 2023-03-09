import 'dart:io';

import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';
import 'package:taskX/core/utils/app_colors.dart';

import 'custom_title_widget.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  final String _currentLocale = Platform.localeName;
  final CalendarController _calendarController = CalendarController();

  String? daySelected;

  @override
  void initState() {
    _calendarController.displayDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  // final timeLocale = DateFormat("HH:mm", currentLocale);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18, bottom: 8),
          child: CustomTitleWidget(
            title: daySelected ?? IntlStrings.of(context).today,
          ),
        ),
        DatePicker(
          DateTime.now(),
          height: 80,
          locale: _currentLocale,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primaryColor,
          selectedTextColor: AppColors.lightShapeColor,
          daysCount: 10,
          onDateChange: (selectedDate) {
            _getDay(selectedDate);
            setState(() {
              if (selectedDate.day == DateTime.now().day) {
                _calendarController.displayDate =
                    selectedDate.add(Duration(hours: DateTime.now().hour));
              } else {
                _calendarController.displayDate = selectedDate;
              }
            });
          },
        ),
        SizedBox(
          height: 200,
          child: SfCalendar(
            controller: _calendarController,
            headerHeight: 0,
            view: CalendarView.day,
            timeSlotViewSettings: const TimeSlotViewSettings(
              // timeFormat: Localizations.localeOf(context).languageCode,
              timeIntervalHeight: 76,
            ),
            todayHighlightColor: AppColors.primaryColor,
            allowViewNavigation: false,
            viewNavigationMode: ViewNavigationMode.none,
            viewHeaderHeight: 0,
          ),
        ),
      ],
    );
  }

  _getDay(DateTime other) {
    var differenceInDay = 0;
    var day = "";
    final currentDate = DateTime.now();
    if (currentDate.day == other.day) {
      differenceInDay = 1;
    } else {
      differenceInDay = currentDate.difference(other).inDays;
    }

    switch (differenceInDay) {
      case 1:
        day = IntlStrings.of(context).today;
        break;
      case 0:
        day = IntlStrings.of(context).tomorrow;
        break;
      default:
        day = IntlStrings.of(context).day(other.day);
    }

    setState(() {
      daySelected = day;
    });
  }
}
