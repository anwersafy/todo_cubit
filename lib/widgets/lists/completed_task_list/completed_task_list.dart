import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../screens/home/home_screen.dart';
import '../../components/search_bar/search_bar_widget.dart';
import '../../components/task_item/task_item_widget.dart';

class CompletedTaskListWidget extends StatefulWidget {
  const CompletedTaskListWidget({super.key});

  @override
  State<CompletedTaskListWidget> createState() =>
      _CompletedTaskListWidgetState();
}

class _CompletedTaskListWidgetState extends State<CompletedTaskListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable:
            Listenable.merge([SearchBarWidget.search, HomeScreen.filterDate]),
        builder: (context, listenable) {
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("tasks")
                  .orderBy("date", descending: true)
                  .orderBy("createdAt", descending: true)
                  .where("completed", isEqualTo: true)
                  .where("date",
                      isGreaterThanOrEqualTo: HomeScreen.filterDate.value)
                  .where("date",
                      isLessThanOrEqualTo: HomeScreen.filterDate.value
                          .add(const Duration(hours: 23, minutes: 59)))
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ExpansionTile(
                  title:
                      Text("Completed Tasks (${snapshot.data!.docs.length})"),
                  initiallyExpanded: true,
                  shape: const Border(),
                  children: [
                    SlidableAutoCloseBehavior(
                      closeWhenOpened: true,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> task =
                              snapshot.data!.docs[index].data();
                          String id = snapshot.data!.docs[index].reference.id;
                          if (SearchBarWidget.search.value.isEmpty) {
                            return TaskItemWidget(
                              id: id,
                              key: Key(id),
                              name: task["name"],
                              completed: task["completed"],
                              date: task["date"],
                              categoryColor: task["category"]["categoryColor"],
                              useAlarm: task["useAlarm"],
                              alarmId: task["alarmId"],
                            );
                          }
                          if (task["name"].toString().toLowerCase().contains(
                              SearchBarWidget.search.value.toLowerCase())) {
                            return TaskItemWidget(
                              id: id,
                              name: task["name"],
                              completed: task["completed"],
                              date: task["date"],
                              categoryColor: task["category"]["categoryColor"],
                              useAlarm: task["useAlarm"],
                              alarmId: task["alarmId"],
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                );
              });
        });
  }
}
