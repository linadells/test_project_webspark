import 'package:flutter/material.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/core/usecase.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';

class GetFieldInfoUseCase
    implements UseCase<DataState<void>, Route> {
  final FindRouteRepository _findRouteRepository;

  GetFieldInfoUseCase(this._findRouteRepository);

  @override
  Future<DataState<void>> call({Route? params}) {
    return _findRouteRepository.sendResult(params);
  }
}