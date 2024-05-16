import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/bloc/users_events.dart';
import 'package:flutter_tasks/bloc/users_state.dart';
import 'package:flutter_tasks/api_repository/api_repository.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UsersState> emit) async {
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
