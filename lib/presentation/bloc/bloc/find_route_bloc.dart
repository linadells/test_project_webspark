import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'find_route_event.dart';
part 'find_route_state.dart';

class FindRouteBloc extends Bloc<FindRouteEvent, FindRouteState> {
  FindRouteBloc() : super(FindRouteInitialState()) {
    on<StartCountingProcessEvent>(onStartCountingProcessEvent);
  }


  Future<void> onStartCountingProcessEvent(StartCountingProcessEvent event, Emitter<FindRouteState> emit)async {
    emit(CountingState(event.apiUrl));
  }
}
