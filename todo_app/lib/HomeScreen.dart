import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'db_services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Personal = true, College = false, Office = false;
  bool suggest = true;
  TextEditingController todoController = TextEditingController();
  Stream? todoStream;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getonTheLoad() async {
    todoStream = await DatabaseService().getTask(
      Personal ? "Personal" : College ? "College" : "Office");
    setState(() {});
  }



  Widget getWork() {
    return StreamBuilder(
      stream: todoStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
          ? Expanded(
            child: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnap = snapshot.data.docs[index];
                return CheckboxListTile(
                  activeColor: Colors.greenAccent.shade400,
                  title: Text(docSnap["work"]),
                  value: docSnap["Yes"],
                  onChanged: (newValue) async {
                    await DatabaseService().tickMethod(
                      docSnap["Id"],
                      Personal ? "Personal" : College ? "College" : "Office");
                    setState(() {
                      Future.delayed(Duration(seconds: 2), () {
                        DatabaseService().removeMethod(
                          docSnap["Id"],
                          Personal ? "Personal" : College ? "College" : "Office");
                      });
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          )
          : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade400,
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(148, 228, 151, 1),
              Colors.white,
              const Color.fromARGB(255, 153, 230, 156),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "To Do List",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                "Let's the work begins !",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Personal
                  ? Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Personal",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  : GestureDetector(
                    onTap: () async {
                      Personal = true;
                      College = false;
                      Office = false;
                      await getonTheLoad();
                      setState(() {});
                    },
                    child: Text(
                      "Personal",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                College
                  ? Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "College",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.greenAccent.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  : GestureDetector(
                    onTap: () async {
                      Personal = false;
                      College = true;
                      Office = false;
                      await getonTheLoad();
                      setState(() {});
                    },
                    child: Text(
                      "College",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                Office
                  ? Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Office",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  : GestureDetector(
                    onTap: () async {
                      Personal = false;
                      College = false;
                      Office = true;
                      await getonTheLoad();
                      setState(() {});
                    },
                    child: Text(
                      "Office",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            getWork(),
          ],
        ),
      ),
    );
  }

  Future openBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(width: 60.0),
                    Text(
                      "Add ToDo Task",
                      style: TextStyle(
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("Add Text"),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the task",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> userTodo = {
                          "work": todoController.text,
                          "Id": id,
                          "Yes": false,
                        };
                        Personal
                          ? DatabaseService().addPersonalTask(userTodo, id)
                          : College
                            ? DatabaseService().addCollegeTask(userTodo, id)
                            : DatabaseService().addOfficeTask(userTodo, id);
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
