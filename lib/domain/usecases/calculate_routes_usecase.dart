import 'package:flutter/material.dart';
import 'package:test_project_webspark/core/usecase.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/route.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';

class CalculateRoutesUsecase
    implements UseCase<List<RouteEntity>, List<FieldInfoEntity>> {
  final FindRouteRepository _findRouteRepository;

  CalculateRoutesUsecase(this._findRouteRepository);

  @override
  Future<List<RouteEntity>> call({List<FieldInfoEntity>? params}) {
    return _findRouteRepository.calculateRoutes(fields: params!);
  }
}