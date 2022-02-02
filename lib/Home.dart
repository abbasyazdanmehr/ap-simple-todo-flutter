import 'package:app/Task.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    Widget showTask(index){
      return Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: tasks[index].isDone?
          Colors.green.withOpacity(0.6):
          Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: IconButton(
            icon: Icon(
              tasks[index].isDone?Icons.check_circle_rounded:Icons.circle,
              color: tasks[index].isDone?Colors.greenAccent:Colors.redAccent,
            ),
            onPressed: (){
              setState(() {
                tasks[index].isDone = !tasks[index].isDone;
              });
            },
          ),
          title: FlatButton(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tasks[index].title,
                  style: TextStyle(
                      color: Colors.white,/*Color(0xff121E31)*/
                      fontSize: 22,
                      decoration:tasks[index].isDone ?
                      TextDecoration.lineThrough :
                      TextDecoration.none
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.delete,color: Colors.lightBlueAccent[100],),
                    onPressed: (){
                      setState(() {
                        tasks.removeAt(index);
                      });
                    }
                )
                // Spacer(),
              ],
            ),
            onPressed: (){
              Navigator.pushNamed(
                context,
                "/TaskPage",
                arguments: Task(title: tasks[index].title,
                  description: tasks[index].description,
                  isDone: tasks[index].isDone,
                  deadLine: tasks[index].deadLine,
                ),
              );
            },

          ),
        ),
      );
    }

    String text1 = "", text2 = "", text3 = "", text4 = "", text5 = "";

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          children: [
            Icon(Icons.work),
            Text(" ToDo"),
          ],
        ),
      ),

      backgroundColor: Color(0xff121E31),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mountain.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(top: 0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return showTask(index);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add_rounded),
        onPressed: (){
          setState(() {
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                height: double.infinity,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 40, left: 10),
                          color: Colors.blue,
                          height: 90,
                          width: double.infinity,
                          child: Text("add one Task",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 40,right: 40),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "title"
                                ),
                                onSaved: (String value){
                                  text1 = value;
                                },
                              ),
                              TextFormField(
                                maxLines: 2,
                                decoration: InputDecoration(
                                    labelText: "description"
                                ),
                                onSaved: (String value){
                                  text2 = value;
                                },
                              ),
                              SizedBox(height: 40,),
                              Container(
                                child: Text("Deadline",style: TextStyle(fontSize: 20),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: size.width/5,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "year"
                                      ),
                                      onSaved: (String value){
                                        text3 = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: size.width/5,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "month"
                                      ),
                                      onSaved: (String value){
                                        text4 = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: size.width/5,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "day"
                                      ),
                                      onSaved: (String value){
                                        text5 = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        ElevatedButton(
                          child: Text("add"),
                          onPressed: (){
                              setState(() {
                                _formKey.currentState.save();
                                print(text1 + text2 + text3 + text4 + text5);
                                tasks.add(Task(title: text1, isDone: false, description: text2, deadLine: text3+"/"+text4+"/"+text5));
                              });
                            Navigator.pop(context);
                            //Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
