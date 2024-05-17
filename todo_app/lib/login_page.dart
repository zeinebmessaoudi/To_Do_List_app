import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/signUp_page.dart';

class loginPage extends StatefulWidget{
  const loginPage ({super.key});

  @override 
  State<loginPage> createState() => _loginPageState();

}

class _loginPageState extends State<loginPage>{
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,top:10),
                    child: Text("Login",
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
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      margin: EdgeInsets.only(left: 70,right: 70),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black12
                      ),
                      child: TextFormField(
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
                  SizedBox(height: 40,),
                  Container(
                   // padding: EdgeInsets.only(top: 30),
                    child: Container(
                      margin: EdgeInsets.only(left: 70,right: 70),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black12
                      ),
                      child: TextFormField(
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
              
                  SizedBox(height: 40,),
              
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 70,right: 70),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account ? " ,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      ),
              
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>signupPage()));
                      },
                        child: Text("Sign up,",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                        ),
                      ),
                    ]
                  )
              
                ]
              ),
            ),
          )
        )
      ),
    );  
  }
}