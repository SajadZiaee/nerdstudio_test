import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? profileImage;

  const UserEntity({
    required this.email,
    required this.username,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  @override
  List<Object?> get props => [email, username, firstName, lastName, profileImage];
}
