import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:quizzype001/model/UserModels/StudentModel.dart';

import 'package:dio/dio.dart' as dio;
import 'package:get/get_connect/http/src/response/response.dart' as get_response;
import 'package:quizzype001/model/ContestModel/contest_model.dart';

import '../../model/Questionmodel/questionModel.dart';
import '../../model/UserModels/UserModel.dart';
import '../service/api/api_import.dart';
import '../service/app/app_service_imports.dart';
part 'authentication/auth.dart';
part'user/user.dart';

