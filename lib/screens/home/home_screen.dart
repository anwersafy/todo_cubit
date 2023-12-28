import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';


import '../../utils/add_zero_to_number.dart';
import '../../utils/bottom_sheet_controller.dart';
import '../../utils/date_time_round_up.dart';
import '../../widgets/components/date_picker/date_picker_widget.dart';
import '../../widgets/layout/header/header_widget.dart';
import '../../widgets/layout/new_task/new_task_widget.dart';
import '../../widgets/lists/completed_task_list/completed_task_list.dart';
import '../../widgets/lists/task_list/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static ValueNotifier<DateTime> filterDate = ValueNotifier(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  static ValueNotifier<bool> isRinging = ValueNotifier(false);
  static ValueNotifier<int> ringingAlarmId = ValueNotifier(0);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();

  DateTime newDate(DateTime selectedDate) {
    String day = addZeroToNumber(selectedDate.day);
    String month = addZeroToNumber(selectedDate.month);
    String year = addZeroToNumber(selectedDate.year);
    String hour = addZeroToNumber(DateTime.now().hour);
    String minute = addZeroToNumber(DateTime.now().minute);

    DateTime newDate = DateTime.parse("$year-$month-$day $hour:$minute:00");

    return alignDateTime(newDate, const Duration(minutes: 5));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2D5E),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            // header
            const HeaderWidget(),

            const SizedBox(
              height: 18,
            ),

            // date picker
            DatePickerWidget(
              onDateChange: (selectedDate) {
                NewTaskWidget.date.value = newDate(selectedDate);
                HomeScreen.filterDate.value = selectedDate;
                date = newDate(selectedDate);
              },
            ),

            const SizedBox(
              height: 24,
            ),

            // task list
            const TaskListWidget(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                color: Colors.grey.shade200,
              ),
            ),

            //completed task list
            const CompletedTaskListWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF08101E),
        onPressed: () {
          NewTaskWidget.date.value = newDate(date);
          NewTaskWidget.category.value = {};
          bottomSheetController.handleBottomSheet(
            context,
            const NewTaskWidget(),
            600,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
