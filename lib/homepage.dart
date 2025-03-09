import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/auth/auth_service.dart';
import 'package:training/firebasestroe.dart';
import 'package:training/provider/state_notifier.dart';

import 'login_screen.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {

    final detail =  ref.watch(displayDetail);
    final notifier =  ref.watch(displayDetail.notifier);

    final FirestoreService firestoreService = FirestoreService();

    final _auth = AuthService();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _note = TextEditingController();

    void openNote(){
      showDialog(context: context, builder: (context)=>AlertDialog(
        content: TextField(
          controller: _note,
        ),
        actions: [
          ElevatedButton(onPressed: (){
            firestoreService.addNote(_note.text);
            _note.clear();
           Navigator.pop(context);
          }, child: Text('Add'))
        ],
      ));
    }


    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: openNote,child: Icon(Icons.add),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name : ${detail.name}'),
          SizedBox(height: 10,),
          Text('age : ${detail.age}'),
          SizedBox(height: 10,),
          Text('email : ${detail.email}'),

          SizedBox(height: 60,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Name'
            ),
            controller: _name,
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Email'
            ),
            controller: _email,
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Age'
            ),
            controller: _age,
          ),
          SizedBox(height: 10,),

          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            _auth.signout();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

          }, child: Text('Signout'))
        ],
      ),
    );
  }
}
