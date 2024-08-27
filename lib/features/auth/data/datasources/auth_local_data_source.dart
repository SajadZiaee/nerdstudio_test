import 'package:drift/drift.dart';
import 'package:nerd_test/features/auth/data/app_database.dart';
import 'package:nerd_test/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserData(UserModel userModel);
  Future<UserModel?> getLastUser();
  Future<void> clearUserData();
  Future<void> cacheAccessToken(String accessToken);
  Future<String?> getAccessToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppDatabase db;

  AuthLocalDataSourceImpl({required this.db});

  @override
  Future<void> cacheUserData(UserModel userModel) async {
    await db.into(db.users).insert(
          UsersCompanion.insert(
            email: userModel.email,
            username: userModel.username,
            firstName: Value(userModel.firstName),
            lastName: Value(userModel.lastName),
            profileImage: Value(userModel.profileImage),
          ),
        );
  }

  @override
  Future<UserModel?> getLastUser() async {
    final user = await db.select(db.users).getSingleOrNull();
    if (user != null) {
      return UserModel(
        email: user.email,
        username: user.username,
        firstName: user.firstName,
        lastName: user.lastName,
        profileImage: user.profileImage,
      );
    }
    return null;
  }

  @override
  Future<void> clearUserData() async {
    await db.delete(db.users).go();
    await db.delete(db.accessTokens).go();
  }

  @override
  Future<void> cacheAccessToken(String accessToken) async {
    try {
      await db.delete(db.accessTokens).go();
    } catch (e) {
      print(e.toString());
    }
    await db.into(db.accessTokens).insert(
          AccessTokensCompanion.insert(
            token: Value(accessToken),
          ),
        );
  }

  @override
  Future<String?> getAccessToken() async {
    final tokenEntry = await db.select(db.accessTokens).getSingleOrNull();
    return tokenEntry?.token;
  }
}
