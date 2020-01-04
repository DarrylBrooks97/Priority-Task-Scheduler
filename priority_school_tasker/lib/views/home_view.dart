import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:priority_school_tasker/models/class.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:priority_school_tasker/services/provider_service.dart';
import 'package:priority_school_tasker/services/auth_service.dart';




class HomeView extends StatefulWidget {
  @override
  //Use to store between the different states based of bottom bar selection
  State<StatefulWidget> createState(){
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {

  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  int _selectedPage = 0;
  final List<Widget> _pageOptions = [
    Tasks(),   //First option
    AddNewAssignment(), //Middle Option
    MotivationalQuotes(), //Right Option
    GetHelp(), //Left Option
//    MyDynamicListView(), //DEFAULT HOME: (_pageOptions.length - 1) index
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedPage,
        onTap: onTabbed,

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
    );
  }
  void onTabbed(int index){
    setState(() {
      _selectedPage = index;
    });
  }
}

//Dynamic List View(HOME)
//Can go back to this from completing adding
/*
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

 */
//Allows user to add an assignment or modify
//Also connects to the screen that allows the user to add a class
class AddNewAssignment extends StatelessWidget {
   String fileContents = "No Classes on File";

   bool loaded = false;
//  AddNewAssignment({Key key, this.Class}) : super(key: key);

  Future<String> getJSON() async{
    return await rootBundle.loadString('assets/userInfo.json');
  }

  Future<List<UserClass>> loadClasses() async{
    List<UserClass> Class = [];
    String string = await getJSON();
    int i = 0;
    final finalJSON = json.decode(string);
    int length = finalJSON.length;
    UserClass newClass = new UserClass.fromJson(finalJSON[0]);
    Class.add(newClass);
    while(i<length-1){
      Class.add(new UserClass.fromJson(finalJSON[i]));
      ++i;
    }
    return Class;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("Classes"),),
        body:
        Container(
          child: FutureBuilder(
              future: this.loadClasses(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      )
                  );
                }
                return
                  ListView.builder(
                      itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          new Card(
                            child: new Container(
                              child: new Center(
                                  child: new Column(
                                    // Stretch the cards in horizontal axis
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      new Text(
                                        // Read the name field value and set it in the Text widget
                                        "Class:" + snapshot.data[index].className,
                                        // set some style to text
                                        style: new TextStyle(
                                            fontSize: 20.0, color: Colors.lightBlueAccent),
                                      ),
                                      new Text(
                                        // Read the name field value and set it in the Text widget
                                        "Weight: " + snapshot.data[index].weight.toString(),
                                        // set some style to text
                                        style: new TextStyle(
                                            fontSize: 20.0, color: Colors.amber),
                                      ),
                                      new Text(
                                        // Read the name field value and set it in the Text widget
                                        "Credit: " + snapshot.data[index].credit.toString(),
                                        // set some style to text
                                        style: new TextStyle(
                                            fontSize: 20.0, color: Colors.greenAccent),
                                      ),
                                    ],
                                  )),
                              padding: const EdgeInsets.all(15.0),
                            ),
                          );
                      });
              }
          ),
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
        appBar: new AppBar(
          title: Text("Tasks"),
          actions: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.reply_thick_solid),
              onPressed: () async{
                try {
                  AuthService auth = Provider.of(context).auth;
                  await auth.signOut();
                  print('Signed Out');
                }
                catch(e){
                  print(e);
                }
              },
            )
          ],
        ),
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

