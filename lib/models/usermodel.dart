import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String user;
  final String password;
  final String typeuser;
  final String address;
  final String lat;
  final String lng;
  UserModel({
    this.id,
    this.name,
    this.user,
    this.password,
    this.typeuser,
    this.address,
    this.lat,
    this.lng,
  });

  UserModel copyWith({
    String id,
    String name,
    String user,
    String password,
    String typeuser,
    String address,
    String lat,
    String lng,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      user: user ?? this.user,
      password: password ?? this.password,
      typeuser: typeuser ?? this.typeuser,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user': user,
      'password': password,
      'typeuser': typeuser,
      'address': address,
      'lat': lat,
      'lng': lng,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      user: map['user'],
      password: map['password'],
      typeuser: map['typeuser'],
      address: map['address'],
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, user: $user, password: $password, typeuser: $typeuser, address: $address, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.id == id &&
        o.name == name &&
        o.user == user &&
        o.password == password &&
        o.typeuser == typeuser &&
        o.address == address &&
        o.lat == lat &&
        o.lng == lng;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        user.hashCode ^
        password.hashCode ^
        typeuser.hashCode ^
        address.hashCode ^
        lat.hashCode ^
        lng.hashCode;
  }
}
