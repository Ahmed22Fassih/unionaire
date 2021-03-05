import 'package:flutter/material.dart';
import 'package:universal/doneScreen.dart';

import 'database/serviceData.dart';
import 'notDoneScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
      routes: {
        DoneScreen.routeName: (ctx) => DoneScreen(),
        NotDoneScreen.routeName: (ctx) => NotDoneScreen(),
  },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKeyUser = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  ServiceData user = ServiceData();

  // String url = 'http://41.38.123.212:7001/test/resources/customers/Mnth' ;
  // String url2 = 'http://41.38.123.212:7001/test/resources/customers/credCRM?p_userId=esam&p_pass=721831';

  Future<void> validUser () async {
    if (_formKeyUser.currentState.validate()){
      bool isAuth = await user.auth(emailController.text, passwordController.text);
      if (isAuth) {
        Navigator.of(context)
            .pushNamed(DoneScreen.routeName);
      } else {
        Navigator.of(context)
            .pushNamed(NotDoneScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKeyUser,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *.75,
                height: MediaQuery.of(context).size.height * .1,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return 'you must enter email' ;
                    }else {
                      return null ;
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.75,
                height: MediaQuery.of(context).size.height * .1,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return 'you must enter correct password' ;
                    }else {
                      return null ;
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.5,
                height: 60,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () {
                    validUser();
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
