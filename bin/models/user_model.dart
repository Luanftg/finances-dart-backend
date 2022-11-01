// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? image;
  bool? isActived;
  DateTime? dtCreated;
  DateTime? dtUpdated;

  UserModel();

  UserModel.create({
    this.id,
    this.name,
    this.email,
    this.image,
    this.isActived,
    this.dtCreated,
    this.dtUpdated,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel.create(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      isActived: map['is_auth'] == 1,
      dtCreated: map['created_at'],
      dtUpdated: map['updated_at'],
    );
  }

  factory UserModel.fromRequest(Map map) {
    return UserModel()
      ..name = map['name']
      ..email = map['email']
      ..password = map['password']
      ..image = map['image'];
  }

  factory UserModel.fromEmail(Map map) {
    return UserModel()
      ..id = map['id']?.toInt()
      ..password = map['password']
      ..image = map['image'];
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, isActived: $isActived, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }
}
