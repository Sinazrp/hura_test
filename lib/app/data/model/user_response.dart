import 'package:hura_test/app/data/model/user.dart';

class UserResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  final Map<String, dynamic> support;

  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  // Convert JSON to UserResponse object
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((userJson) => User.fromJson(userJson))
          .toList(),
      support: json['support'] as Map<String, dynamic>,
    );
  }
}
