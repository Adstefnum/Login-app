import 'package:flutter/material.dart';
import 'regend.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      body: Center(
        child: SignupPage()
        )
      )
    );
}
}
 
class SignupPage extends StatefulWidget {
 
SignupPageState createState() => SignupPageState();
 
}
 

class SignupPageState extends State<SignupPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;
String msg = ' ';
bool errortextvisibility = false;

 userRegistration() async{

  setState(() {
  visible = true ; 
  });

  // Getting value from Controller
  var name = nameController.text;
  var email = emailController.text;
  var password = passwordController.text;
  

  // SERVER API URL
  var url = 'https://luckiest-noon.000webhostapp.com/Register.php';

  var response  = await http.post(url,body:{"name":name,"email":email,"password":password});
 

   // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
  
     setState(() {
  visible = false ; 
  });

}

final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

     var endValue = parsed.map<Map>((json) => parsed.fromJson(json)).toList();

      if(endValue == 'Registration Succesful'){
    Route route = MaterialPageRoute(builder: (context) => RegEnd());
                Navigator.push(context,route);
  }
  else{
    errortextvisibility = true;
    msg = endValue;
  }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
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
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,50.0,0.0,0.0),
                  child: Text(
                    'Hey',
                    style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold)
                  )
                ),

                 Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0,135.0,0.0,0.0),
                  child: Text(
                    'Buddy',
                    style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold)
                  )
                ),

        
                Container(
                  padding: EdgeInsets.fromLTRB(210.0,135.0,0.0,0.0),
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
                        controller: emailController,
                      
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
                        
                        controller: nameController,
                        decoration: InputDecoration(
                        labelText: 'NAME',
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

                        TextField(
                        
                        controller: passwordController, 
                        obscureText: true,
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

                     
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector( 
                            onTap: () {  userRegistration();},
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
                      ),
                      SizedBox(height:20.0),
                      
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already registered ?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat'
                                )
                              ),
                              SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Login',
                                style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)
                              ))
                            ]
                          ),
              
                          
                        
                      
                    ]
                  )
                )
              ]
            ),
          )
        ],
      )
      )
        ]
        
      )
      
    );
  }


}