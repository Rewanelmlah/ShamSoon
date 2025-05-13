import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/notifications/data/models/notification_model.dart';
import '../../../core/error/failure.dart';
import '../../../core/helpers/constant_manager.dart';
import '../../../core/helpers/global_variables.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/network_request.dart';

class NotificationDataSource{
  final NetworkService networkService = sl<NetworkService>(instanceName: ConstantManager.dioService);
  Future<BaseModel<GetNotificationsResponse>> getNotifications(int currentPage)async{
    final result = await networkService.callApi<GetNotificationsResponse>(
      NetworkRequest(
        method: RequestMethod.get,
        path: ApiConstants.notifications,
        queryParameters: {
          'current_page' : currentPage
        },
      ),
      mapper: (json) => GetNotificationsResponse.fromJson(json)
    );
    return result;
  }
}