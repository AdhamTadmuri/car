import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:adham/app/my_app_controller.dart';
import 'package:adham/core/data/repositories/shared_prefreance_repository.dart';
import 'package:adham/core/enums/connectivity_status.dart';
import 'package:adham/core/enums/message_type.dart';
import 'package:adham/core/services/cart_service.dart';
import 'package:adham/core/services/connectivity_service.dart';
import 'package:adham/core/services/location_service.dart';
import 'package:adham/core/services/notification_service.dart';
import 'package:adham/ui/shared/colors.dart';
import 'package:adham/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';


double screenWidth(double perecent) {
  if (GetPlatform.isMobile)
    return Get.width / perecent;
  else
    return Get.height / perecent;
}

double screenHeight(double perecent) {
  if (GetPlatform.isMobile)
    return Get.height / perecent;
  else
    return Get.width / perecent;
}

SharedPrefranceRepository get storage => Get.find<SharedPrefranceRepository>();

// CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
LocationService get locationService => Get.find<LocationService>();
NotificationService get notificationService => Get.find<NotificationService>();

bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

void fadeInTransition(Widget view) {
  Get.to(view, transition: Transition.fadeIn);
}


double get taxAmount => 0.18;
double get deliveryAmount => 0.1;

void checkConnection(Function function) {
  if (isOnline)
    function;
  else
    CustomToast.showMeassge(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}
