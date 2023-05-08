import 'dart:convert';


class SignUpModel {
  String name;
  String phone;
  String email;
  String password;
  SignUpModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  // SignUpModel copyWith({
  //   String? name,
  //   String? phone,
  //   String? email,
  //   String? password,
  // }) {
  //   return SignUpModel(
  //     name: name ?? this.name,
  //     phone: phone ?? this.phone,
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'phone': phone,
  //     'email': email,
  //     'password': password,
  //   };
  // }

  // factory SignUpModel.fromMap(Map<String, dynamic> map) {
  //   return SignUpModel(
  //     name: map['name'],
  //     phone: map['phone'],
  //     email: map['email'],
  //     password: map['password'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source));

  // @override
  // String toString() {
  //   return 'SignUpModel(name: $name, phone: $phone, email: $email, password: $password)';
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  
  //   return other is SignUpModel &&
  //     other.name == name &&
  //     other.phone == phone &&
  //     other.email == email &&
  //     other.password == password;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //     phone.hashCode ^
  //     email.hashCode ^
  //     password.hashCode;
  // }
}
