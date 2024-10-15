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

final class SendingResults extends FindRouteState {
  const SendingResults();
}

final class ResultIsSended extends FindRouteState {
  List<RouteModel> routeModels;
  List<FieldInfoModel> fieldInfoModels;
  ResultIsSended({required this.routeModels, required this.fieldInfoModels});
}

final class DetailedResultState extends FindRouteState {
  List<RouteModel> routeModels;
  List<FieldInfoModel> fieldInfoModels;
  int index;
  DetailedResultState(this.fieldInfoModels, this.routeModels, this.index);
}

final class ErrorFindRouteState extends FindRouteState {
  final DioException error;
  const ErrorFindRouteState(this.error);
}

final class ErrorInSendingResultsState extends FindRouteState {
  final DioException error;
  final List<RouteModel> routeModels;
  final List<FieldInfoModel> fieldInfoModels;
  const ErrorInSendingResultsState(
      this.error, this.fieldInfoModels, this.routeModels);
}
