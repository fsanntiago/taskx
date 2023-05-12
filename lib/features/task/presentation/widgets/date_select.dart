import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:taskX/core/functions/build_alert_dialog.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

import '../../../../core/utils/constants.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  DateTime? date;

  @override
  void initState() {
    date = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentLocale = Localizations.localeOf(context).languageCode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 25,
                color: AppColors.blackColor.withOpacity(0.6),
              ),
              sizeHor(5),
              Text(
                "Deadline",
                style: AppTextStyles.textRegularSecondary(
                  color: AppColors.blackColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
          sizeVer(10),
          InkWell(
            onTap: () {
              _showCalendar(
                context,
                currentLocale,
                (selectedDate) {
                  setState(
                    () {
                      date = selectedDate;
                    },
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: AppColors.darkBlueColor),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              padding: const EdgeInsets.all(13),
              // height: 50,
              width: 500,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date!.day == DateTime.now().day
                        ? 'Deadline date'
                        : DateFormat.yMMMMd(currentLocale).format(date!),
                    style: AppTextStyles.inputText(
                      color: date!.day == DateTime.now().day
                          ? AppColors.darkBlueColor.withOpacity(0.6)
                          : AppColors.darkBlueColor.withOpacity(0.8),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.blue,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showCalendar(BuildContext context, String currentLocale,
      Function(DateTime) onSubmitDate) {
    return buildAlertDialog(
        context, _calendar(context, currentLocale, onSubmitDate));
  }

  Widget _calendar(BuildContext context, String currentLocale,
      Function(DateTime) onSubmitDate) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return SizedBox(
            // color: Colors.amber,
            height: height - 400,
            width: width,
            child: Directionality(
              textDirection: currentLocale == 'ar' ||
                      currentLocale == 'fa' ||
                      currentLocale == 'he' ||
                      currentLocale == 'ps' ||
                      currentLocale == 'ur'
                  ? ui.TextDirection.rtl
                  : ui.TextDirection.ltr,
              child: SfDateRangePicker(
                controller: _datePickerController,
                onCancel: () {
                  Navigator.of(context).pop();
                },
                onSubmit: (value) {
                  if (value is DateTime) {
                    onSubmitDate(value);
                    Navigator.of(context).pop();
                  }
                },
                view: DateRangePickerView.month,
                headerHeight: 50,
                minDate: DateTime.now(),
                selectionColor: AppColors.darkBlueColor,
                todayHighlightColor: AppColors.darkBlueColor,
                selectionTextStyle: AppTextStyles.textBold(),
                showActionButtons: true,
                initialSelectedDate: DateTime.now(),
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: AppColors.darkBlueColor,
                  textStyle: AppTextStyles.subTitle(
                    color: AppColors.whiteColor,
                  ),
                ),
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(dayFormat: 'EEE'),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayTextStyle: AppTextStyles.textMedium(
                    color: AppColors.blue,
                  ),
                  disabledDatesTextStyle: AppTextStyles.textRegularSecondary(
                    color: Colors.grey,
                  ),
                  textStyle: AppTextStyles.textRegularSecondary(
                    color: AppColors.darkBlueColor,
                  ),
                  todayCellDecoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.blue,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                yearCellStyle: DateRangePickerYearCellStyle(
                  todayTextStyle: AppTextStyles.textRegularSecondary(
                    color: AppColors.blue,
                  ),
                  todayCellDecoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.blue,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  textStyle: AppTextStyles.textRegularSecondary(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
