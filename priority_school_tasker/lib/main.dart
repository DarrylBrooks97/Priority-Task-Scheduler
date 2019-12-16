import 'package:flutter/material.dart';
import 'package:priority_school_tasker/services/auth_service.dart';
import 'package:priority_school_tasker/views/login_signup_view.dart';
import 'package:priority_school_tasker/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
          title: 'Priority School Tasker',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: HomeView(),
        routes: <String, WidgetBuilder> {
          '/signIn' : (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn,),
//          '/signUp' : (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp,),
          '/home' : (BuildContext context) => HomeController(),
        },
      )
    );
  }
}


class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if(snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeView() : SignUpView();
        }
        return CircularProgressIndicator();
      }
    );
  }
}

class Provider extends InheritedWidget {
  final AuthService auth;
  Provider({Key key, Widget child, this.auth,}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) => (context.inheritFromWidgetOfExactType(Provider) as Provider);
}