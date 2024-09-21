import 'dart:convert';

class UserModel {
  // User Details
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

  // Student Details
  final String? selectEducation;
  final String? schoolName;
  final String? schoolAddress;
  final String? boardOption;
  final String? classValue;
  final String? mediumName;
  final String? aadharcard;

  UserModel({
    // User Details
    this.fullname,
    this.address,
    this.email,
    this.city,
    this.state,
    this.pincode,
    required this.phoneNumber,
    this.dob,
    this.id,
    this.role,

    // Student Details
    this.selectEducation,
    this.schoolName,
    this.schoolAddress,
    this.boardOption,
    this.classValue,
    this.mediumName,
    this.aadharcard,
  });

  // Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json['fullname'],
      address: json['address'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      phoneNumber: json['phoneNumber'],
      dob: json['dob'],
      id: json['_id'],
      role: json['role'],

      // Student fields
      selectEducation: json['selectEducation'],
      schoolName: json['schoolName'],
      schoolAddress: json['schoolAddress'],
      boardOption: json['boardOption'],
      classValue: json['classValue'],
      mediumName: json['mediumName'],
      aadharcard: json['aadharcard'],
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
      'pincode': pincode,
      'phoneNumber': phoneNumber,
      'dob': dob,
      '_id': id,
      'role': role,

      // Student fields
      'selectEducation': selectEducation,
      'schoolName': schoolName,
      'schoolAddress': schoolAddress,
      'boardOption': boardOption,
      'classValue': classValue,
      'mediumName': mediumName,
      'aadharcard': aadharcard,
    };
  }

  // Convert to JSON string
  String toRawJson() => json.encode(toJson());

  // Create UserModel from JSON string
  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));
}
