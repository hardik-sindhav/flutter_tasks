import 'package:equatable/equatable.dart';
import 'package:flutter_tasks/model/repos_model.dart';

abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object> get props => [];
}

class ReposInitial extends ReposState {}

class ReposLoading extends ReposState {}

class ReposLoaded extends ReposState {
  final List<ReposModel> repos;

  const ReposLoaded({required this.repos});

  @override
  List<Object> get props => [repos];
}

class ReposError extends ReposState {
  final String message;

  const ReposError({required this.message});

  @override
  List<Object> get props => [message];
}
