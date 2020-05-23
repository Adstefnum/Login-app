import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      body: Center(
        child: PassChange()
        )
      )
    );
}
}
 
class PassChange extends StatefulWidget {
 
PassChangeState createState() => PassChangeState();
 
}
 

class PassChangeState extends State {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
      children: <Widget>[
          Container(
                  padding: EdgeInsets.only(top:80.0, left:20.0, right:20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                        labelText: 'EMAIL',
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
      
      SizedBox(height:20.0),
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
                                'SEND',
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
      
        
     