import 'package:adham/app/my_app.dart';
import 'package:adham/app/my_app_controller.dart';
import 'package:adham/core/data/repositories/shared_prefreance_repository.dart';
import 'package:adham/core/services/cart_service.dart';
import 'package:adham/core/services/connectivity_service.dart';
import 'package:adham/core/services/location_service.dart';
import 'package:adham/core/services/notification_service.dart';
import 'package:adham/firebase_options.dart';
import 'package:adham/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPrefranceRepository());
  // Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(NotificationService());

  runApp(MyApp());
}
