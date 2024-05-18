import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/api_repository/api_repository.dart';
import 'package:flutter_tasks/bloc/search_events.dart';
import 'package:flutter_tasks/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetUser>(_onFetchSearch);
  }

  void _onFetchSearch(GetUser event, Emitter<SearchState> emit) async {
    ApiRepository apiRepository = ApiRepository();
    emit(SearchLoading());
    try {
      final search = await apiRepository.searchUsers(event.username);

      emit(SearchLoaded(search: search));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
