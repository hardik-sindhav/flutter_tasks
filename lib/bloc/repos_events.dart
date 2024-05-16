import 'package:equatable/equatable.dart';

abstract class ReposEvents extends Equatable {
  const ReposEvents();

  @override
  List<Object> get props => [];
}

class FetchRepos extends ReposEvents {
  final String username;

  const FetchRepos({required this.username});

  @override
  List<Object> get props => [username];
}
