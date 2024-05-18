import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/bloc/users_events.dart';
import 'package:flutter_tasks/bloc/users_state.dart';
import 'package:flutter_tasks/api_repository/api_repository.dart';

class UsersBloc extends Bloc<UserEvents, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<FetchUser>(_onFetchUsers);
  }

  void _onFetchUsers(FetchUser event, Emitter<UsersState> emit) async {
    ApiRepository usersRepository = ApiRepository();
    emit(UsersLoading());
    try {
      final users = await usersRepository.fetchUsers();
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(UsersError(message: e.toString()));
    }
  }
}
