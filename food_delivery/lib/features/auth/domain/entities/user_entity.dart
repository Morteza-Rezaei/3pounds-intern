class UserEntity {
  final String uid;
  final String? email;
  final String? name;

  UserEntity({required this.uid, this.email, this.name});
  // todo: move to extension and dto , model relation
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name};
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(uid: map['uid'], email: map['email'], name: map['name']);
  }
}
