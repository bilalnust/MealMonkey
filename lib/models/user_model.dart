import 'dart:convert';

class UserModel {
  String uid;
  String name;
  String email;
  String imageURL;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.imageURL,
  });

  UserModel copyWith({
    String uid,
    String name,
    String email,
    String imageURL,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'imageURL': imageURL});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      imageURL: map['imageURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.name == name &&
      other.email == email &&
      other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      imageURL.hashCode;
  }
}
