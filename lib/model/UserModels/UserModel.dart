import 'dart:convert';

class UserDetails {
  var fullname;
  var address;
  var email;
  var city;
  var state;
  var pincode;
  var phoneNumber;
  var dob;

  UserDetails({
    required this.fullname,
    required this.address,
    required this.email,
    required this.city,
    required this.state,
    required this.pincode,
    required this.phoneNumber,
    required this.dob,
  });

  // Factory method to create a UserDetails instance from a JSON map
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      fullname: json['fullname'],
      address: json['address'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      phoneNumber: json['phoneNumber'],
      dob: json['dob'],
    );
  }

  // Method to convert a UserDetails instance to a JSON map
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
    };
  }

  String toRawJson() => json.encode(toJson());
  factory UserDetails.fromRawJson(String str) =>
      UserDetails.fromJson(json.decode(str));
}
