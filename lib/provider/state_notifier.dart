import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/model/detail_model.dart';

class DisplayInfo extends StateNotifier<Detail>{
  DisplayInfo(): super(Detail(age: '', name: '', email: ''));

  void change(String age, String name, String email){
    state =Detail(age: age, name: name, email: email);

  }

}
final displayDetail = StateNotifierProvider<DisplayInfo, Detail>((ref)=>DisplayInfo());
