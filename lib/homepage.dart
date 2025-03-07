import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/provider/state_notifier.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(displayProvider);
    final notifier = ref.watch(displayProvider.notifier);
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _email = TextEditingController();

    return Scaffold(
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
          ElevatedButton(onPressed: (){
            notifier.change(_name.text, _email.text,_age.text);
          }, child: Text('change'))
        ],
      ),
    );
  }
}
