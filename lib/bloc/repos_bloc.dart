import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/api_repository/api_repository.dart';
import 'package:flutter_tasks/bloc/repos_events.dart';
import 'package:flutter_tasks/bloc/repos_state.dart';

class ReposBloc extends Bloc<ReposEvents, ReposState> {
  ReposBloc() : super(ReposInitial()) {
    on<FetchRepos>(_onFetchRepos);
  }

  void _onFetchRepos(FetchRepos event, Emitter<ReposState> emit) async {
    ApiRepository reposRepository = ApiRepository();
    emit(ReposLoading());
    try {
      final repos = await reposRepository.fetchRepos(event.username);
      emit(ReposLoaded(repos: repos));
    } catch (e) {
      emit(ReposError(message: e.toString()));
    }
  }
}
