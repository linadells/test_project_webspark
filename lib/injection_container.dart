import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project_webspark/data/data_sources.dart/route_api_service.dart';
import 'package:test_project_webspark/data/repository/find_route_repository.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';
import 'package:test_project_webspark/domain/usecases/calculate_routes_usecase.dart';
import 'package:test_project_webspark/domain/usecases/get_field_info_usecase.dart';
import 'package:test_project_webspark/domain/usecases/send_result_usecase.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

final sl=GetIt.instance;
  
Future<void> initializeDependencies() async {
  try {
   sl.registerSingleton<Dio>(Dio());
   sl.registerSingleton<RouteApiService>(RouteApiService(sl()));
   sl.registerSingleton<FindRouteRepository>(FindRouteRepositoryImpl(sl()));
   sl.registerSingleton<GetFieldInfoUseCase>(GetFieldInfoUseCase(sl()));
   sl.registerSingleton<SendResultUseCase>(SendResultUseCase(sl()));
   sl.registerSingleton<CalculateRoutesUsecase>(CalculateRoutesUsecase(sl()));
   sl.registerFactory<FindRouteBloc>(()=>FindRouteBloc(sl(), sl(), sl()));
  } catch (e) {
    print("Error during dependency registration: $e");
  }
}