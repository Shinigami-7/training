class Detail{
  String age;
  String name;
  String email;

  Detail({required this.age,required this.name, required this.email});

  Map<String, dynamic> toJson(){
    return {
      'age' : age,
      'name' : name,
      'email' : email
    };
  }

  factory Detail.fromJson (Map<String, dynamic> json){
    return Detail(age: json['age'], name: json['name'], email: json['email']);
  }

}