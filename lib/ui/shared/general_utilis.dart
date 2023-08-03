
import 'package:adham/core/enums/message_type.dart';
import 'package:adham/core/services/connectivity_service.dart';
import 'package:adham/core/services/location_service.dart';
import 'package:adham/ui/shared/utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../app/my_app_controller.dart';
import '../../core/data/repositories/shared_prefreance_repository.dart';
import '../../core/enums/connectivity_status.dart';
import '../../core/services/notification_service.dart';
import 'colors.dart';
import 'custom_widgets/custom_toast.dart';

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

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });