import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNo;
  final String? username;
  final String? password;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNo, username, password];


  factory User.fromJson(Map<String, Object?> json) => User(
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"].toString(),
        phoneNo: json["phone_no"] as String,
        username: json["username"] as String,
        password: json["description"] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_no'] = phoneNo;
    data['username'] = username;
    data['password'] = password;

    return data;
  }
}
