import 'package:equatable/equatable.dart';

abstract class SearchEvents extends Equatable {
  const SearchEvents();

  @override
  List<Object> get props => [];
}

class GetUser extends SearchEvents {
  final String username;

  const GetUser({required this.username});

  @override
  List<Object> get props => [username];
}
