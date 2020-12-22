import 'dart:convert';

class UserModel {
  final String name;
  final String user;
  final String password;
  final String typepassword;
  UserModel({
    this.name,
    this.user,
    this.password,
    this.typepassword,
  });

  UserModel copyWith({
    String name,
    String user,
    String password,
    String typepassword,
  }) {
    return UserModel(
      name: name ?? this.name,
      user: user ?? this.user,
      password: password ?? this.password,
      typepassword: typepassword ?? this.typepassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'user': user,
      'password': password,
      'typepassword': typepassword,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      name: map['name'],
      user: map['user'],
      password: map['password'],
      typepassword: map['typepassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, user: $user, password: $password, typepassword: $typepassword)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.name == name &&
      o.user == user &&
      o.password == password &&
      o.typepassword == typepassword;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      user.hashCode ^
      password.hashCode ^
      typepassword.hashCode;
  }
}
