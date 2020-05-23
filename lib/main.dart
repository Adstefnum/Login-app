import 'package:flutter/material.dart';
import 'signup.dart';
import 'pass_change.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import 'dart:convert';

void main() {
   runApp(MaterialApp(
     home:LoginUser(),
     title: 'Luckiest Noon',
     debugShowCheckedModeBanner: false,
     ));
     }
    
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      body: Center(
        child: LoginUser()
        )
      )
    );
}
}

class LoginUser extends StatefulWidget {

  LoginUserState createState() => LoginUserState();}
  
class LoginUserState extends State<LoginUser>{
final loginEmail = TextEditingController();
final loginPassword = TextEditingController();
bool visible = false;
String msg = ' ';
bool errortextvisibility = false;

  
   userLogin() async{

  // Showing CircularProgressIndicator.
  
 setState(() {
  visible = true ; 
  }); 


  // Getting value from Controller
  var email = loginEmail.text;
  var password = loginPassword.text;
  

  // SERVER API URL
  var url = 'https://luckiest-noon.000webhostapp/Login.php';

  // Starting Web API Call.
  var response = await http.post(url, body: {'email': email, 'password' : password});

  
   // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
  
     setState(() {
  visible = false ; 
  });
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      var endValue = parsed.map<Map>((json) => parsed.fromJson(json)).toList();

      if(endValue == 'Data Matched'){
    Route route = MaterialPageRoute(builder: (context) => HomePage());
                Navigator.push(context,route);
  }

  else{

    errortextvisibility = true;
    msg = endValue;
  }
  }
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     resizeToAvoidBottomPadding: false,
      body:ListView(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                          Visibility(
          visible: visible, 
          child: Container(
            child: LinearProgressIndicator()
            )
          ),
              Visibility(
            visible: errortextvisibility,
            child:Container(
          child:Text(msg,style:TextStyle(fontSize: 20.0, color: Colors.red)),)),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,50.0,0.0,0.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold)
                  )
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(15.0,135.0,0.0,0.0),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold)
                  )
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(170.0,135.0,0.0,0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold, color: Colors.green)
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top:265.0, left:20.0, right:20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: loginEmail,
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
                      SizedBox(height: 20.0),
                      TextField(
                        obscureText:true,
                        controller: loginPassword,
                        decoration: InputDecoration(
                        labelText: 'PASSWORD',
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

                          

                      SizedBox(height:5.0),
                      Container(
                        alignment: Alignment(1.0,0.0),
                        padding: EdgeInsets.only(top:15.0, left:20.0),
                        child: InkWell( 
                           onTap: () {
                                  Route route = MaterialPageRoute(builder: (context) => PassChange());
                                  Navigator.push(context, route);
                                },
                          child: Text('Forgot Password',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline
                          )
                          ),
                          )
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector( 
                            onTap: () { userLogin();},
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                                )
                              )
                            ))
                        )
                      ),
                      SizedBox(height:20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: ImageIcon(AssetImage('assets/download.png')),
                            ),
                            Center(
                              child: Text('LOGIN WITH GOOGLE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                              ))
                          )]
                          ))),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'New here ?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat'
                                )
                              ),
                              SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                 Route route = MaterialPageRoute(builder: (context) => SignupPage());
                                  Navigator.push(context, route);
                                },
                                child: Text('Register',
                                style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)
                              ))
                            ]
                          )

                            
                        
                      
                    ]
                  )
                )
              ]
            ),
          )
        ],
      )
    );}
}



