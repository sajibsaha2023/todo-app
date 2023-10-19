import 'package:flutter/material.dart';
import 'package:localdatabase/src/modules/home/add_task_screen.dart';
import 'package:localdatabase/src/modules/home/edit_task_screen.dart';
import 'package:localdatabase/src/utils/database_helper.dart';
import '../../data/global_widgets/appbar.dart';
import '../../model/note_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> datalist = [];

  DBHelper dbHelper = DBHelper();

  getDataItem()async{
    datalist =  await dbHelper.getCartData();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataItem();


  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const AppBarView(),
        body: ListView.builder(
          itemCount: datalist.length,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                child: Card(
                  elevation: 3,
                  child: Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: ValueKey<int>(index),
                    onDismissed: (DismissDirection direction) {
                      print("delete");
                    },
                    child: ListTile(
                      title: Text("${datalist[index].title}"),
                      subtitle: Text("${datalist[index].subtitle}"),
                      leading: Icon(Icons.account_box),
                      trailing: InkWell(
                          onTap: (){
                            Note note = datalist[index];
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EditTaskScreen(note:note)));
                          },
                          child: Icon(Icons.edit)),
                    ),
                  ),
                )
            );
          },
        ),

        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()));
            // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
            // .push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
