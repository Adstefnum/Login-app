import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      body: Center(
        child: HomePage()
        )
      )
    );
}
}
 
class HomePage extends StatefulWidget {
 
HomePageState createState() => HomePageState();
 
}
 

class HomePageState extends State {

 Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
      children: <Widget>[
          Container(
                  padding: EdgeInsets.only(top:50.0, left:20.0, right:20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                        labelText: 'Input your search',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                        )
                        )

                      ),
        ]
      )
      ),
      
      SizedBox(height:100.0),
      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector( 
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'SEARCH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                                )
                              )
                            ))
                        )
                      ),
      ]
    ));
  }
}
      
