import 'package:nerd_test/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? accessToken;

  const UserModel({
    required String email,
    required String username,
    String? firstName,
    String? lastName,
    String? profileImage,
    this.accessToken,
  }) : super(
          email: email,
          username: username,
          firstName: firstName,
          lastName: lastName,
          profileImage: profileImage,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'],
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'profile_image': profileImage,
      'access_token': accessToken,
    };
  }
}
