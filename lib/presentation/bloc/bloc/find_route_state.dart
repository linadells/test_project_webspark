part of 'find_route_bloc.dart';

@immutable
sealed class FindRouteState extends Equatable {
  final String? apiUrl;
  const FindRouteState({this.apiUrl});
  @override
  List<Object?> get props => [apiUrl];
}

final class FindRouteInitialState extends FindRouteState {}

final class CountingState extends FindRouteState {
  const CountingState(String apiUrl) : super(apiUrl: apiUrl);
}

final class ReadyResultState extends FindRouteState {
  List<RouteModel> routeModels;
  List<FieldInfoModel> fieldInfoModels;
  ReadyResultState({required this.routeModels, required this.fieldInfoModels});
}

final class DetailedResultState extends FindRouteState {
  RouteModel routeModel;
  FieldInfoModel fieldInfoModel;
  DetailedResultState(this.fieldInfoModel, this.routeModel);
}

final class ErrorFindRouteState extends FindRouteState {
  final DioException error;
  const ErrorFindRouteState(this.error);
}
