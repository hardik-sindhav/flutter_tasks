import 'package:equatable/equatable.dart';

abstract class UsersEvents extends Equatable {
  const UsersEvents();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UsersEvents {}
