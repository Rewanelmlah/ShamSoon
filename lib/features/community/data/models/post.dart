/*
* "id": 3,
                    "user_id": 9,
                    "title": "Updated Post Title",
                    "content": "This is the updated content of the post.",
                    "created_at": "2025-03-18T17:33:48.000000Z",
                    "updated_at": "2025-03-18T18:11:14.000000Z",
                    "user": {
                        "id": 9,
                        "username": "shrouk",
                        "email": "shrouk55@gmail.com",
                        "name": "shrouk",
                        "phone": "0109207062",
                        "profile_image": null,
                        "phone_verified_at": null,
                        "email_verified_at": null,
                        "fcm_token": null,
                        "status": "active",
                        "created_at": "2025-03-18T16:37:27.000000Z",
                        "updated_at": "2025-03-18T16:37:27.000000Z",
                        "social_id": null,
                        "role_id": 1
                    },*/

import 'package:shamsoon/features/community/data/models/comments.dart';

class PostsResponse{
  List<Post> posts;
  final int totalPages;

  PostsResponse({
    required this.posts,
    required this.totalPages
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
    posts: (json['posts']['data'] as List)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['posts']["total"]
  );
}

class Post{
  int? index;
  int? id;
  int? userId;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  User? user;
  int? likeCount;
  List<PostComment>? comments;

  Post({
    this.index,
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    this.likeCount,
    this.comments
});

  Post copyWith({
    int? index,
    int? id,
    int? userId,
    String? title,
    String? content,
    String? createdAt,
    String? updatedAt,
    User? user,
    int ? likeCount,
    List<PostComment>? comments,
}) => Post(
    index: index ?? this.index,
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    user: user ?? this.user,
    likeCount: likeCount ?? this.likeCount,
    comments: comments ?? this.comments
);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    content: json["content"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    user: json['user'] != null? User.fromJson(json["user"]) : null,
    likeCount: json['likes_count'],
    comments: json['comments'] != null? (json['comments'] as List)
        .map((e) => PostComment.fromJson(e))
        .toList() : null,
  );
}

class User{
  int id;
  String username;
  String email;
  String name;
  String phone;
  String profileImage;
  String phoneVerifiedAt;
  String emailVerifiedAt;
  String fcmToken;
  // String status;
  String createdAt;
  String updatedAt;
  String socialId;
  int roleId;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.phone,
    required this.profileImage,
    required this.phoneVerifiedAt,
    required this.emailVerifiedAt,
    required this.fcmToken,
    // required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.socialId,
    required this.roleId
});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    name: json["name"],
    phone: json["phone"],
    profileImage: json["profile_image"]?? '',
    phoneVerifiedAt: json["phone_verified_at"]?? '',
    emailVerifiedAt: json["email_verified_at"]?? '',
    fcmToken: json["fcm_token"]?? '',
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    socialId: json["social_id"]?? '',
    roleId: json["role_id"],
  );
}