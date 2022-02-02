


import 'package:app/Task.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    var thisTask = ModalRoute.of(context).settings.arguments as Task;

    return Scaffold(
      backgroundColor: Color(0xff121E31),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        title: Text(thisTask.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/scele.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 5,
                        //style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text(
                    thisTask.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pink,
                        width: 3,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
              ),
              Container(
                child: Text(thisTask.deadLine??"deadLine",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 50,),
              IconButton(
                icon: Icon(
                  thisTask.isDone?Icons.check_circle_rounded:Icons.circle,
                  color: thisTask.isDone?Colors.greenAccent:Colors.redAccent,
                ),
                onPressed: (){
                  setState(() {
                    thisTask.isDone = !thisTask.isDone;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
