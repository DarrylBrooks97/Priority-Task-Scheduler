import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/semantics.dart';
=======
import 'package:flutter/services.dart' show rootBundle;
>>>>>>> e961c640ba63e22c72f36aa4a415fd5f699c69c8

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

  int _selectedPage = 3;
  final _pageOptions = [
    GetHelp(), //Left Option
    AddNewAssignment(), //Middle Option
    MotivationalQuotes(), //Right Option
    MyDynamicListView(), //DEFAULT HOME: (_pageOptions.length - 1) index
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Priority School Tasker',
      theme: ThemeData(
<<<<<<< HEAD
     
        primarySwatch: Colors.blue,
=======
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
>>>>>>> e961c640ba63e22c72f36aa4a415fd5f699c69c8
      ),
      home: Scaffold
      (
        appBar: new AppBar(title: Text("Dynamic List View"),),
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
              icon: Icon(Icons.live_help),
              title: Text('Help'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('Add')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Quotes')
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
<<<<<<< HEAD
}

//Allows user to add an assignment or modify
//Also connects to the screen that allows the user to add a class
class AddNewAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      Text('Add Class')
    );
  }
}

//Allows the user to learn about different ways to use the app
class GetHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      Text('Get Help!')
    );
  }
}

//Allows the user to learn about different ways to use the app
class MotivationalQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //NOTE: Pull in a random array and display it the user and center it on the screen
      Text('\"A mind is a terrible thing to waste\" - Harriet Tubman ')
    );
  }
}
=======
}
>>>>>>> e961c640ba63e22c72f36aa4a415fd5f699c69c8
