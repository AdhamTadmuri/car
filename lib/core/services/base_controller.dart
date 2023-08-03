import 'package:bot_toast/bot_toast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../ui/shared/custom_widgets/custom_toast.dart';
import '../../ui/shared/general_utilis.dart';
import '../enums/message_type.dart';
import '../enums/operation_type.dart';
import '../enums/request_status.dart';

class BaseController extends GetxController {
  // UserRepository userRepository = Get.put(UserRepository());

  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    if (isOnline) {
      requestStatus.value = RequestStatus.LOADING;
      operationType.add(type!);
      await function;
      requestStatus.value = RequestStatus.DEFUALT;
      operationType.remove(type);
    } else {
      CustomToast.showMeassge(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }

  Future runFullLoadingFunction({
    required Future function,
  }) async {
    // checkConnection(() async {
    //   customLoader();
    //   await function;
    //   BotToast.closeAllLoading();
    // });
    if (isOnline) {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    } else {
      CustomToast.showMeassge(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }
}
