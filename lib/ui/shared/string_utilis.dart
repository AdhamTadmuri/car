import 'package:adham/core/data/repositories/shared_prefreance_repository.dart';
import 'package:adham/core/enums/message_type.dart';
import 'package:adham/core/services/connectivity_service.dart';
import 'package:adham/core/services/location_service.dart';
import 'package:adham/core/services/notification_service.dart';
import 'package:adham/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/my_app_controller.dart';
import '../../core/enums/connectivity_status.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPasswordValid(String value) {
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  return regExp.hasMatch(value);
}


