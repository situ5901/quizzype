import 'dart:convert';

class UserModel {
  final String? fullname;
  final String? address;
  final String? email;
  final String? city;
  final String? state;
  final String? pincode;
  final String phoneNumber;
  final String? dob;
  final String? id;
  final String? role;

  UserModel({
   this.fullname,
   this.address,
   this.email,
   this.city,
   this.state,
   this.pincode,
    required this.phoneNumber,
   this.dob,
   this.role,
     this.id,
  });

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json['fullname'],
      address: json['address'],
      email: json['email'],
      city: json['city'],
      role: json['role'],
      state: json['state'],
      pincode: json['pincode'],
      phoneNumber: json['phoneNumber'] ,
      dob: json['dob'],
      id: json['_id'] ,
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'address': address,
      'email': email,
      'city': city,
      'state': state,
      'role': role,
      'pincode': pincode,
      'phoneNumber': phoneNumber,
      'dob': dob,
      '_id': id,
    };
  }

  String toRawJson() => json.encode(toJson());
  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));
}
