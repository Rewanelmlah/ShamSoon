class BaseModel<T> {
  final String message;
  final T data;

  BaseModel({
    required this.message,
    required this.data,
  });

  factory BaseModel.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic json)? jsonToModel,
  }) {
    return BaseModel(
      message: json['message'] ?? '',
      data: jsonToModel != null ? json['data'] == null? jsonToModel(json) : jsonToModel(json['data']) : json['data'],
    );
  }
}
