import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';


void main() => runApp(MyApp());

class FileUtils{
  static Future<String> get getFilePath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async{
      final path = await getFilePath;
      return File('/Users/darrylb/Documents/GitHub Projects/HackFSU_2019/priority_school_tasker/assets/userInfo.txt');
  }

  static Future<String> readFromFile() async{
    try{
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    }catch(e){
      return "No File Found";
    }
  }

}

class MyApp extends StatefulWidget {
  @override
  //Use to store between the different states based of bottom bar selection
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  int _selectedPage = 0;
  final _pageOptions = [
    Tasks(),   //First option
    AddNewAssignment(), //Middle Option
    MotivationalQuotes(), //Right Option
    GetHelp(), //Left Option
//    MyDynamicListView(), //DEFAULT HOME: (_pageOptions.length - 1) index
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Priority School Tasker',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold
      (
//        appBar: new AppBar(title: Text("Home"),),
        //NOTE: Add array of different page states to change between each state instead of
        //always loading the DynamicListView(HOME)
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _selectedPage,
          onTap: (int index){
            setState((){
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(CupertinoIcons.collections),
              title: Text('Tasks')
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(CupertinoIcons.add_circled),
              title: Text('Add')
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(CupertinoIcons.book),
              title: Text('Quotes')
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(CupertinoIcons.search),
              title: Text('Help'),
            ),
          ],
        ),
      ), //Scaffold
    ); //MyMaterialApp
  }
}

//Dynamic List View(HOME)
//Can go back to this from completing adding
class MyDynamicListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      // backing data
      final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
        'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
        'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
        'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
        'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
        'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
        'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
        'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
        'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

      return ListView.builder(
        itemCount: europeanCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(europeanCountries[index]),
          );
        },
      );

    }
}

//Allows user to add an assignment or modify
//Also connects to the screen that allows the user to add a class
class AddNewAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String fileContents = "No Information";
    final myController = TextEditingController();

    return Scaffold(
      appBar: new AppBar(title: Text("Add Assignments"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField( controller: myController,),
          RaisedButton(
            child:Text("Import Classes"),
            onPressed: () {
              Text("fileContents");
            }),

        ]
      )
    );
  }
}

//Allows the user to learn about different ways to use the app
class GetHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Help"),),
    );
  }
}

//Allows the user to learn about different ways to use the app
class MotivationalQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Quote of the Day"),),
      body: Center(
        child: Text(
          "\"A mind is a terrible thing to waste\" - Harriet Tubman ",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40.0,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  static const double taskBoarder = 20.0;
  final List<String> entries = <String> ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  final List<int> colorCodes = <int> [900, 800, 700, 600, 500, 400, 300, 200, 100];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(title: Text("Tasks"),),
      body:
        ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext content, int index){
            return Container(
              height: 100,
              decoration: new BoxDecoration(
                color: Colors.amber[colorCodes[index]],
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(taskBoarder),
                  topRight: const Radius.circular(taskBoarder),
                  bottomLeft: const Radius.circular(taskBoarder),
                  bottomRight: const Radius.circular(taskBoarder),
                ),
              ),
              child:
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text('Task ${entries[index]}'),
                ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
      //NOTE: Pull in a random array and display it the user and center it on the screen
//          floatingActionButton: FloatingActionButton(
//          elevation: 10.0,
//          child: Icon(Icons.add),
//          onPressed: (){
//            print('\"A mind is a terrible thing to waste\" - Harriet Tubman ');
//          }
//      ),
    );
  }
}

