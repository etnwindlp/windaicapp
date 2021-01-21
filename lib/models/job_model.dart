import 'dart:convert';

class JobModel {
  final String id;
  final String idofficer;
  final String nameofficer;
  final String iduser;
  final String nameuser;
  final String title;
  final String todo;
  final String status;
  JobModel({
    this.id,
    this.idofficer,
    this.nameofficer,
    this.iduser,
    this.nameuser,
    this.title,
    this.todo,
    this.status,
  });

  JobModel copyWith({
    String id,
    String idofficer,
    String nameofficer,
    String iduser,
    String nameuser,
    String title,
    String todo,
    String status,
  }) {
    return JobModel(
      id: id ?? this.id,
      idofficer: idofficer ?? this.idofficer,
      nameofficer: nameofficer ?? this.nameofficer,
      iduser: iduser ?? this.iduser,
      nameuser: nameuser ?? this.nameuser,
      title: title ?? this.title,
      todo: todo ?? this.todo,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idofficer': idofficer,
      'nameofficer': nameofficer,
      'iduser': iduser,
      'nameuser': nameuser,
      'title': title,
      'todo': todo,
      'status': status,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JobModel(
      id: map['id'],
      idofficer: map['idofficer'],
      nameofficer: map['nameofficer'],
      iduser: map['iduser'],
      nameuser: map['nameuser'],
      title: map['title'],
      todo: map['todo'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobModel(id: $id, idofficer: $idofficer, nameofficer: $nameofficer, iduser: $iduser, nameuser: $nameuser, title: $title, todo: $todo, status: $status)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JobModel &&
        o.id == id &&
        o.idofficer == idofficer &&
        o.nameofficer == nameofficer &&
        o.iduser == iduser &&
        o.nameuser == nameuser &&
        o.title == title &&
        o.todo == todo &&
        o.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idofficer.hashCode ^
        nameofficer.hashCode ^
        iduser.hashCode ^
        nameuser.hashCode ^
        title.hashCode ^
        todo.hashCode ^
        status.hashCode;
  }
}
