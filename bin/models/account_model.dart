import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountModel {
  int? id;
  String? name;
  String? image;
  double? balance;
  int? userId;

  AccountModel();

  factory AccountModel.fromMap(Map map) {
    return AccountModel()
      ..id = map['id']
      ..name = map['name']
      ..image = map['image']
      ..balance = map['balance']
      ..userId = map['id_user'];
  }

  factory AccountModel.fromRequest(Map map) {
    return AccountModel()
      ..id = map['id']?.toInt()
      ..name = map['name']
      ..image = map['image']
      ..balance = map['balance']
      ..userId = map['id_user']?.toInt();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'balance': balance,
      'id_user': userId,
    };
  }

  String toJson() => json.encode(toMap());
  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, image: $image, balance: $balance, userId: $userId)';
  }
}
