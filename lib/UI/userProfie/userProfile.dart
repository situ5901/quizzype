import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/UI/HomeScreen/controller.dart';

import 'controller.dart';


class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: HomeController(),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            title: Text('User Profile'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDetailRow(
                    label: 'Full Name',
                    value:  controller.userModel!.fullname?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'Email',
                    value: controller.userModel!.email?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'Phone Number',
                    value: controller.userModel!.phoneNumber?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'Address',
                    value: controller.userModel!.address?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'City',
                    value: controller.userModel!.city ?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'State',
                    value: controller.userModel!.state ?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'Pincode',
                    value: controller.userModel!.pincode ?? '',
                  ),
                  SizedBox(height: 10),
                  ProfileDetailRow(
                    label: 'Date of Birth',
                    value: controller.userModel!.dob ?? '',
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
