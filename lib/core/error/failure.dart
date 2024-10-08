import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object> properties;

  const Failure([this.properties = const <Object>[]]);

  @override
  List<Object> get props => properties;
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message}) : super([message]);

  @override
  String toString() => 'ServerFailure: $message';
}

class CacheFailure extends Failure {}
