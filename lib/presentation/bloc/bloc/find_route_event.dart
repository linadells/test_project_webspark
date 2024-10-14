part of 'find_route_bloc.dart';

@immutable
sealed class FindRouteEvent {}

final class StartCountingProcessEvent extends FindRouteEvent{
  String apiUrl;
  StartCountingProcessEvent(this.apiUrl);
}