import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/domain/usecases/get_field_info_usecase.dart';
import 'package:test_project_webspark/domain/usecases/send_result_usecase.dart';

part 'find_route_event.dart';
part 'find_route_state.dart';

class FindRouteBloc extends Bloc<FindRouteEvent, FindRouteState> {
  GetFieldInfoUseCase _getFieldInfoUseCase;
  SendResultUseCase _sendResultUseCase;
  FindRouteBloc(this._getFieldInfoUseCase, this._sendResultUseCase) : super(FindRouteInitialState()) {
    on<StartCountingProcessEvent>(onStartCountingProcessEvent);
  }


  Future<void> onStartCountingProcessEvent(StartCountingProcessEvent event, Emitter<FindRouteState> emit)async {
    event.apiUrl="flutter.webspark.dev/flutter/api";
    emit(CountingState(event.apiUrl));
    var res=await _getFieldInfoUseCase(params: event.apiUrl);
    if(res is DataFailed) emit(ErrorFindRouteState(res.error!));
  }
}
