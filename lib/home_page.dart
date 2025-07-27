import 'package:database/local/db_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbReference;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbReference = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbReference!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.blue,),
      body: allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.blue[100],shape:RoundedRectangleBorder(borderRadius:BorderRadiusGeometry.all(Radius.circular(11)) ) ,
                    leading: Text((index+1).toString(),
                    ),
                    title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
                    subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          InkWell(child: Icon(Icons.edit),onTap: ()
                            {
                              titleController.text=allNotes[index][DBHelper.COLUMN_NOTE_TITLE];
                              descController.text=allNotes[index][DBHelper.COLUMN_NOTE_DESC];
                              showModalBottomSheet(shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // 🌟 Top edges rounded
                              ),
                                  context: context, builder: (context)
                              {

                                return getBottomSheet(isUpdate: true,sno:allNotes[index][DBHelper.COLUMN_NOTE] );});
                            },),
                          InkWell(onTap:()async{
                            bool check=await dbReference!.deleteNote(sno: allNotes[index][DBHelper.COLUMN_NOTE]);
                            if(check)
                              {
                                getNotes();
                              }
                          },
                              child: Icon(Icons.delete, color: Colors.red)),

                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('No notes yet!!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          titleController.clear();
          descController.clear();
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // 🌟 Top edges rounded
            ),

            context: context,
            builder: (context) {
              return getBottomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget getBottomSheet({bool isUpdate=false,int sno=0})
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // 👈 Rounded edges
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(color: Colors.blue,
            width: double.infinity,
            height: 75,

            child: Center(
              child: Text(
                isUpdate?"Update Note":"Add Note",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 21),
                TextField(
                  controller: titleController,

                  decoration: InputDecoration(
                    hintText: "Enter title here",
                    label: Text("Title"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                TextField(
                  maxLines: 4,
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: "Enter description here",
                    label: Text("Description"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
                SizedBox(height: 11),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: BorderSide(width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        onPressed: () async {
                          var mTitle = titleController.text;
                          var mDesc = descController.text;
                          if (mTitle.isNotEmpty && mDesc.isNotEmpty) {
                            bool check = isUpdate?await dbReference!.updateNote(title: mTitle, desc: mDesc, s_no: sno):await dbReference!.addNote(
                              mTitle: mTitle,
                              mDesc: mDesc,
                            );
                            if (check) {
                              getNotes();
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Fill the required fields"),
                              ),
                            );
                          }
                          descController.clear();
                          titleController.clear();
                          Navigator.pop(context);
                        },
                        child: Text(isUpdate?"Update Note":"Add Note",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(width: 11),
                    Expanded(
                      child: OutlinedButton(

                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.blue,
                          iconColor: Colors.blue,
                          surfaceTintColor: Colors.blue,
                          side: BorderSide(width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),

                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Text(""),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );

  }
}
