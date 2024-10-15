part of 'find_route_bloc.dart';

@immutable
sealed class FindRouteEvent {}

final class StartCountingProcessEvent extends FindRouteEvent{
  String apiUrl;
  StartCountingProcessEvent(this.apiUrl);
}

final class ViewDetailsOfRouteEvent extends FindRouteEvent{
  RouteModel routeModel;
  FieldInfoModel fieldInfoModel;
  ViewDetailsOfRouteEvent(this.routeModel, this.fieldInfoModel);
}