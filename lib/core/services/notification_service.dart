

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../../ui/shared/general_utilis.dart';
import '../data/models/notification_model.dart';
import '../enums/application_state.dart';
import '../enums/notification_type.dart';

class NotificationService {
  StreamController<NotificationModel> notificationStream =
      StreamController.broadcast();

  NotificationService() {
    onInit();
  }

  void onInit() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);

      //!--- Here to call api ----

      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        // TODO: If necessary send token to application server.

        //!--- Here to call api ----
      }).onError((err) {
        // Error getting token.
      });

      if (GetPlatform.isIOS) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;

        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          provisional: true,
          sound: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
        );

        // if (settings.authorizationStatus == AuthorizationStatus.denied) {

        // }
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.FOREGROUND);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.BACKGROUND);
      });
    } catch (e) {
      print(e);
    }
  }

  void handelNotification(
      {required NotificationModel model,
      required ApplicationState applicationState}) {
    notificationStream.add(model);
    if (model.notificatioNType == NotificationType.SUBSECRIPTION.name) {
      storage.setSubStatus(model.model == '1' ? true : false);
    }
  }
}
