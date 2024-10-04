import 'dart:developer';
import 'dart:io';


// import 'package:campus/Data/Services/App/app_service_imports.dart';
// import 'package:campus/Models/Dining/dining_daily_menu_model.dart';
// import 'package:campus/Models/Dining/dining_fixed_menu_model.dart';
// import 'package:campus/Models/Dining/dining_menu_model.dart';
// import 'package:campus/Models/model_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:quizzype001/model/UserModels/StudentModel.dart';

import 'package:dio/dio.dart' as dio;
import 'package:get/get_connect/http/src/response/response.dart' as get_response;

//import '../../presentation/screen/common/app_dialog/app_dialog.dart';
import '../../model/Questionmodel/questionModel.dart';
import '../../model/UserModels/UserModel.dart';
import '../../model/leaderboard/leaderBoard.dart';
import '../service/api/api_import.dart';
import '../service/app/app_service_imports.dart';
import 'package:dio/dio.dart';
part 'authentication/auth.dart';

part'user/user.dart';

// part 'Dining/dining_repository.dart';
// part 'Dining/dining_review_repository.dart';
//
// part 'File/file_repository.dart';
// part 'Housing/housing_repository.dart';
// part 'Housing/create_flat_repository.dart';
// part 'Market/market_repository.dart';
// part 'User/user_repository.dart';
// part 'Notification/notification_repository.dart';
// part 'Search/search_repository.dart';