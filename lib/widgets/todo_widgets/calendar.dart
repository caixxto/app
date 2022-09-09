import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        headerStyle: const HeaderStyle(
          decoration: BoxDecoration(
            color: Color.fromRGBO(44, 44, 46, 1),
          ),
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
              color: Colors.yellow,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProTextRegular'),
          leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.yellow,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.yellow,
          )
          ),
        calendarStyle: const CalendarStyle(
          rowDecoration: BoxDecoration(
            color: Color.fromRGBO(44, 44, 46, 1),
          ),
          todayDecoration: BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
              color: Color.fromRGBO(28, 28, 30, 1),
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProTextRegular'
          ),
          defaultTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProTextRegular'
          ),
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'SFProTextRegular'
            ),
        ),

        daysOfWeekStyle: const DaysOfWeekStyle(
          decoration: BoxDecoration(
            color: Color.fromRGBO(44, 44, 46, 1),
          ),
          weekdayStyle: TextStyle(
              color: Color.fromRGBO(235, 235, 245, 0.3),
              fontSize: 13,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProTextRegular'
          ),

        ),
        
        focusedDay: DateTime.now(), 
        firstDay: DateTime.utc(2012, 10, 16), 
        lastDay: DateTime.utc(2030, 3, 14));
  }

}