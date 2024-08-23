
import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
//import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quizzype001/core/string/preference_keys.dart';



import '../../../core/string/preference_keys.dart';

import '../../repository/initialize_repository.dart';
import '../api/api_import.dart';

part 'app_service.dart';
part 'database_service.dart';
// part 'device_info_service.dart';
// part 'location_service.dart';
part 'messaging_service.dart';