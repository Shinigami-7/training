import 'package:flutter/material.dart';
import 'package:training/auth/auth_service.dart';
import 'package:training/homepage.dart';
import 'package:training/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _auth = AuthService();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _login, child: Text('Login') ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                }, child: Text('Sign Up') ),
              ],
            )
          ],
        ),
      ),

    );
  }
  _login()async{
    final user = await _auth.loginuser(_email.text, _pass.text);
    if(user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
      debugPrint('Login Successfully');
    }
    else{
      debugPrint('Someting Went Wrong');

    }
  }
}
