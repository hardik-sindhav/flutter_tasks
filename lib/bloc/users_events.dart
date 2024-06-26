import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable {
  const UserEvents();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvents {
  final String username;

  const FetchUser({required this.username});

  @override
  List<Object> get props => [username];
}
