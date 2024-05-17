import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?>signUpMethod(String email, String password)async{

    try{
      UserCredential credential =
      await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      ) ;
      return credential .user;
         }catch(e){
          print("Failed to signUp user !! ");
         }
         return null;
         
  }
}