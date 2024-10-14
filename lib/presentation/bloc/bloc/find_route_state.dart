part of 'find_route_bloc.dart';

@immutable
sealed class FindRouteState extends Equatable{
  final String? apiUrl;
  const FindRouteState({this.apiUrl});
    @override
  List<Object?> get props => [apiUrl];
}

final class FindRouteInitialState extends FindRouteState {}

final class CountingState extends FindRouteState {
  const CountingState(String apiUrl):super(apiUrl: apiUrl);
}

final class ReadyResultState extends FindRouteState {}

final class DetailedResultState extends FindRouteState {}

final class ErrorFindRouteState extends FindRouteState {
  final DioException error;
  const ErrorFindRouteState(this.error);
}