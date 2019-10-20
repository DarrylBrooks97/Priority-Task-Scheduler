import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart' show rootBundle;


void main() => runApp(MyApp());

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
              icon: Icon(Icons.storage),
              title: Text('Tasks')
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.plus_one),
              title: Text('Add')
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Quotes')
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.live_help),
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
    return Scaffold(
      appBar: new AppBar(title: Text("Add Assignments"),),
//       floatingActionButton: FloatingActionButton(
//          elevation: 10.0,
//          child: Icon(Icons.add),
//          onPressed: (){
//            print('Add class');
//          }
//      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Tasks"),),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 1 Name' +
                '\nClass' + '\nDate Due')),
          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 2 Name' +
                '\nClass' + '\nDate Due')),

          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 3 Name' +
                '\nClass' + '\nDate Due')),

          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 4 Name' +
                '\nClass' + '\nDate Due')),

          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 5 Name' +
                '\nClass' + '\nDate Due')),

          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Task 6 Name' +
                '\nClass' + '\nDate Due')),

          ),
        ]
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

