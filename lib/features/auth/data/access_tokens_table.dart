import 'package:drift/drift.dart';

@DataClassName('AccessToken')
class AccessTokens extends Table {
  TextColumn get token => text().nullable()();
}
