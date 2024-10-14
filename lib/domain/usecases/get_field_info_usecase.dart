import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/core/usecase.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';

class GetFieldInfoUseCase
    implements UseCase<DataState<List<FieldInfoEntity>>, String> {
  final FindRouteRepository _findRouteRepository;

  GetFieldInfoUseCase(this._findRouteRepository);

  @override
  Future<DataState<List<FieldInfoEntity>>> call({String? params}) {
    return _findRouteRepository.getFieldInfo(baseUrl: params!);
  }
}