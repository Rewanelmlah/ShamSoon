class CommentsResponse{
  List<PostComment> comments;
  int totalPagesNumber;

  CommentsResponse({required this.comments, required this.totalPagesNumber});

  factory CommentsResponse.fromJson(Map<String, dynamic> json) => CommentsResponse(
    comments: (json['Comments'] as List).map((e) => PostComment.fromJson(e)).toList(),
    totalPagesNumber: json['total_pages_number'] ?? 1,
  );
}

class PostComment{
  int? id;
  int? userId;
  int? postId;
  String? content;
  String? createdAt;
  String? updatedAt;

  PostComment({this.id, this.userId, this.postId, this.content, this.createdAt, this.updatedAt});

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
    id: json['id'] ?? 0,
    userId: json['user_id'] ?? 0,
    postId: json['post_id'] ?? 0,
    content: json['content'] ?? '',
    createdAt: json['created_at'] ?? '',
    updatedAt: json['updated_at'] ?? '',
  );
}