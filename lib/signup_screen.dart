import 'package:flutter/material.dart';
import 'package:training/auth/auth_service.dart';
import 'package:training/homepage.dart';
import 'package:training/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  final _auth = AuthService();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confpass = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child:
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'email',
              ),
              controller: _email,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
              controller: _pass,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Conform Password'
              ),
              controller: _confpass,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:_signup, child: Text('Sign in') )
          ],
        ),
      ),

    );
  }
  _signup() async {
   if(_pass.text == _confpass.text){
     final user = await _auth.createUser(_email.text, _pass.text);
     if(user != null){
       debugPrint('User Created Successfully');
       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
     }
   }
   else{
     debugPrint('Password doesn\'t match');
   }
  }
}
