import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/core/usecase.dart';
import 'package:test_project_webspark/domain/entities/route.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';

class SendResultUseCase
    implements UseCase<DataState<void>, RouteEntity> {
  final FindRouteRepository _findRouteRepository;

  SendResultUseCase(this._findRouteRepository);

  @override
  Future<DataState<void>> call({RouteEntity? params}) {
    return _findRouteRepository.sendResult(params);
  }
}