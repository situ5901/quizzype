
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart' as gt;
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzype001/core/string/error_string.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import 'package:quizzype001/model/common/device_info.dart';


import '../../../main.dart';
// import '../../../model/UserModels/StudentModel.dart';
import '../../../model/UserModels/UserModel.dart';

/// api service imports
part 'api_service.dart';
part 'dio_interceptors.dart';
part 'dio_exceptions.dart';

part 'authentication/auth_api.dart';
part 'user/user.dart';