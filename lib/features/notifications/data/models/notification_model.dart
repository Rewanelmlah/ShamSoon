class GetNotificationsResponse{
  List<NotificationModel> notifications;
  int totalPagesNumber;


  GetNotificationsResponse({required this.notifications, required this.totalPagesNumber});

  factory GetNotificationsResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationsResponse(
        notifications: (json['notifications']['data'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList(),
        totalPagesNumber: json['notifications']['total']
    );
  }
}

class NotificationModel{
  int? id;
  int? userId;
  String? title;
  String? body;
  List? data;
  bool? read;
  String? createdAt;
  String? updatedAt;

  NotificationModel({this.id, this.userId, this.title, this.body, this.data, this.read, this.createdAt, this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    data = json['data'];
    read = json['read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}