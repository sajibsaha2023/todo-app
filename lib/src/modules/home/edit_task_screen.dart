import 'package:flutter/material.dart';
import 'package:localdatabase/src/model/note_model.dart';

import '../../utils/database_helper.dart';

class EditTaskScreen extends StatefulWidget {
  Note note ;
   EditTaskScreen({super.key,required this.note});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DBHelper dbHelper = DBHelper();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController subTitleTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleTextEditingController.text = widget.note.title.toString();
    subTitleTextEditingController.text = widget.note.subtitle.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
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
                dbHelper.updatedQuentity(Note(
                  id:widget.note.id,
                  title: widget.note.title,
                  subtitle: widget.note.subtitle
                ));
              },
              child: Text("save"),
            ),
          )
        ]),
      ),
    );
  }
}
