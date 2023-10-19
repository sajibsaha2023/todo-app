import 'package:flutter/material.dart';
import 'package:localdatabase/src/model/note_model.dart';
import 'package:localdatabase/src/utils/database_helper.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController subTitleTextEditingController = TextEditingController();

  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
              obscureText: false,
              controller: titleTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter title',
              )),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: false,
              controller: subTitleTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter subtitle',
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                dbHelper.insertData(Note(
                    title: titleTextEditingController.text.toString(),
                    subtitle: subTitleTextEditingController.text.toString(),
                    date: "12/12/12",
                    priority: "high")).then((value) => {
                      print("successfully added to database")
                }).onError((error, stackTrace) => {
                  print("failed to add database")
                });

              },
              child: Text("save"),
            ),
          )
        ]),
      ),
    );
  }
}
