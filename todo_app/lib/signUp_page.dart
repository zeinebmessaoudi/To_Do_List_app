import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/HomeScreen.dart';
import 'package:todo_app/firebase_services/auth_service.dart';
import 'package:todo_app/login_page.dart';
import 'firebase_options.dart';


class signupPage extends StatefulWidget{
  const signupPage ({super.key});

  @override 
  State<signupPage> createState() => _signupPageState();

}

class _signupPageState extends State<signupPage>{

  final FirebaseServices _auth = FirebaseServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override

  void dispose(){

    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage("images/fondVert.jpeg"),
             fit: BoxFit.cover
             )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,top:10),
                  child: Text("SignUp",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black
                  ),
                  ),
                ),
            
                SizedBox(height: 60,),
            
                Container(
                  padding: EdgeInsets.only(left: 20,top:30),
                  child: Text("Welcome!",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Container(
                    margin: EdgeInsets.only(left: 70,right: 70),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12
                    ),
                    child: TextFormField(
            
                      controller: _usernameController,
                      style: TextStyle(
                        color: Colors.blue,
            
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        hintText:"Username",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: InputBorder.none,
                        filled: true
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 25,),
            
                Container(
                 // padding: EdgeInsets.only(top: 70),
                  child: Container(
                    margin: EdgeInsets.only(left: 70,right: 70),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.blue,
            
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        hintText:"Email..",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: InputBorder.none,
                        filled: true
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
            
                Container(
                 // padding: EdgeInsets.only(top: 70),
                  child: Container(
                    margin: EdgeInsets.only(left: 70,right: 70),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.blue,
            
                      ),
            
                      decoration: InputDecoration(
                        fillColor: Colors.black12,
                        hintText:"Password",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: InputBorder.none,
                        filled: true
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 30,),
            
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(left: 70,right: 70),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: ()async{
                         String usename =  _usernameController.text;
                         String email =  _emailController.text;
                         String password =  _passwordController.text;


                         User? user = await _auth.signUpMethod(email, password);

                         if(user != null){

                          print ("User is successfully created !! ");
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                         }
                      },
                       child: Text("SignUp ",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 22,
                    ),
                    ),
                    ),
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ! " ,
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ),
            
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) =>loginPage()));
                    },
                      child: Text("Login,",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      ),
                      ),
                    ),
                  ]
                )              
            
              ]
            ),
          )
        )
      ),
    );  
  }
}