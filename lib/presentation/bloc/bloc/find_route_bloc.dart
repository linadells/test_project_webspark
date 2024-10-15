import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/data/models/field_info_model.dart';
import 'package:test_project_webspark/data/models/route_model.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/route.dart';
import 'package:test_project_webspark/domain/usecases/calculate_routes_usecase.dart';
import 'package:test_project_webspark/domain/usecases/get_field_info_usecase.dart';
import 'package:test_project_webspark/domain/usecases/send_result_usecase.dart';
import 'package:test_project_webspark/utils/calculate_route.dart';

part 'find_route_event.dart';
part 'find_route_state.dart';

class FindRouteBloc extends Bloc<FindRouteEvent, FindRouteState> {
  late final String apiUrl;
  final GetFieldInfoUseCase _getFieldInfoUseCase;
  final CalculateRoutesUsecase _calculateRoutesUsecase;
  final SendResultUseCase _sendResultUseCase;
  FindRouteBloc(this._getFieldInfoUseCase, this._sendResultUseCase,
      this._calculateRoutesUsecase)
      : super(FindRouteInitialState()) {
    on<StartCountingProcessEvent>(onStartCountingProcessEvent);
    on<ViewDetailsOfRouteEvent>(onViewDetailsOfRouteEvent);
    on<SendResultEvent>(onSendResultEvent);
  }

  Future<void> onStartCountingProcessEvent(
      StartCountingProcessEvent event, Emitter<FindRouteState> emit) async {
    event.apiUrl = "flutter.webspark.dev/flutter/api";
    emit(CountingState(event.apiUrl));
    apiUrl = event.apiUrl;
    var res = await _getFieldInfoUseCase(params: event.apiUrl);
    if (res is DataFailed) {
      emit(ErrorFindRouteState(res.error!));
    } else {
      List<RouteModel> routes =
          await _calculateRoutesUsecase(params: res.data) as List<RouteModel>;
      emit(ReadyResultState(
          routeModels: routes,
          fieldInfoModels: res.data as List<FieldInfoModel>));
    }
  }

  Future<void> onSendResultEvent(
      SendResultEvent event, Emitter<FindRouteState> emit) async {
    emit(SendingResults());
    List results = [];
    event.routes.forEach((route) async {
      results.add(await _sendResultUseCase.call(params: route as RouteEntity));
    });
    results.forEach((res) {
      if (res is DataFailed) {
        emit(ErrorFindRouteState(res.error!));
      }
    });

    emit(ResultIsSended(
        routeModels: event.routes, fieldInfoModels: event.fieldInfoModels));
  }

  void onViewDetailsOfRouteEvent(
      ViewDetailsOfRouteEvent event, Emitter<FindRouteState> emit) {
    emit(DetailedResultState(event.fieldInfoModel, event.routeModel));
  }
}
