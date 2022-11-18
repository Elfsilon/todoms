import 'package:flutter/material.dart';
import 'package:todoms/shared/theme/app_theme.dart';
import 'package:todoms/shared/utils/constants/constants.dart';
import 'package:todoms/shared/utils/constants/date_time.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.initialDate,
    required this.focusedDate,
    this.onSelect,
  });

  final DateTime initialDate;
  final DateTime focusedDate;
  final Function(DateTime date)? onSelect;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late int selectedMonth = widget.initialDate.month;
  late int selectedYear = widget.initialDate.year;
  late DateTime selectedDate = widget.initialDate;

  int get daysCount {
    final start = DateTime(2022, selectedMonth);
    final end = DateTime(2022, selectedMonth + 1);
    return end.difference(start).inDays;
  }

  int get startOffset => DateTime(selectedYear, selectedMonth, 1).weekday - 1;
  
  int get endOffset {
    final lastDay = DateTime(selectedYear, selectedMonth + 1, 0).day;
    final lastDayWeekday = DateTime(selectedYear, selectedMonth, lastDay).weekday;
    return 7 - lastDayWeekday;
  }

  void nextMonth() {
    setState(() {
      if (selectedMonth >= 12) {
        selectedMonth = 1;
        selectedYear = selectedYear + 1;
      } else {
        selectedMonth++;
      }
    });
  } 

  void prevMonth() {
    setState(() {
      if (selectedMonth <= 1) {
        selectedMonth = 12;
        selectedYear = selectedYear - 1;
      } else {
        selectedMonth--;
      }
    });
  } 

  void onDaySelected(int day) {
    final newSelectedDate = DateTime(selectedYear, selectedMonth, day);
    setState(() {
      selectedDate = newSelectedDate;
    });
    if (widget.onSelect != null) widget.onSelect!(newSelectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Constants.s12),
          child: Row(
            children: [
              const SizedBox(width: Constants.s16),
              GestureDetector(
                onTap: prevMonth,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded, 
                  color: AppTheme.of(context).palette.foreground.secondary
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "${months[selectedMonth - 1]} $selectedYear",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: nextMonth,
                child: Icon(
                  Icons.keyboard_arrow_right_rounded, 
                  color: AppTheme.of(context).palette.foreground.secondary
                ),
              ),
              const SizedBox(width: Constants.s16),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: DateTime.daysPerWeek,
            childAspectRatio: 1,
            children: [
              const WeekdayLabel(title: "Mon"),
              const WeekdayLabel(title: "Tue"),
              const WeekdayLabel(title: "Wed"),
              const WeekdayLabel(title: "Thu"),
              const WeekdayLabel(title: "Fri"),
              const WeekdayLabel(title: "Sat"),
              const WeekdayLabel(title: "Sun"),
              ...List.generate(startOffset, (_) => const DayCell(inactive: true)),
              ...List.generate(daysCount, (day) => GestureDetector(
                onTap: () => onDaySelected(day + 1),
                child: DayCell(
                  day: day + 1,
                  marked: widget.focusedDate.day == day + 1 
                    && widget.focusedDate.month == selectedMonth 
                    && widget.focusedDate.year == selectedYear,
                  selected: selectedDate.day == day + 1 
                    && selectedDate.month == selectedMonth 
                    && selectedDate.year == selectedYear,
                ),
              )),
              ...List.generate(endOffset, (_) => const DayCell(inactive: true)),
            ],
          ),
        )
      ],
    );
  }
}

class WeekdayLabel extends StatelessWidget {
  const WeekdayLabel({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}

class DayCell extends StatelessWidget {
  const DayCell({
    super.key,
    this.day = 0,
    this.marked = false,
    this.selected = false,
    this.inactive = false,
  });

  final bool inactive;
  final bool selected;
  final bool marked;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: inactive ? Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppTheme.of(context).palette.foreground.tertiary,
          shape: BoxShape.circle,
        ),
      ) : Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppTheme.of(context).palette.custom.merigold.primary : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text("$day", style: TextStyle(
            fontSize: 16,
            color: selected 
              ? AppTheme.of(context).palette.foreground.primary 
              : marked 
                ? AppTheme.of(context).palette.custom.merigold.primary 
                : AppTheme.of(context).palette.foreground.primary,
          )),
      ),
    );
  }
}