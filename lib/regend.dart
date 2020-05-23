import 'package:flutter/material.dart';
import 'main.dart';


class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      body: Center(
        child: RegEnd()
        )
      )
    );
}
}
 
class RegEnd extends StatefulWidget {
 
RegEndState createState() => RegEndState();
 
}
 

class RegEndState extends State {
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
     resizeToAvoidBottomPadding: false,
      body:ListView(
        
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
             
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,70.0,0.0,0.0),
                  child: Text(
                    'Welcome to luckiestnoon, tap the button below to login',
                    style: TextStyle(fontSize: 12.0)
                  )),
                  SizedBox(height: 40.0),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0,130.0,0.0,0.0),
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector( 
                            onTap: () {  Route route = MaterialPageRoute(builder: (context) => LoginUser());
                                  Navigator.push(context, route);},
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                                )
                              )
                            ))
                        )
                      )]))]));}
                  

}