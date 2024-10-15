part of 'find_route_bloc.dart';

@immutable
sealed class FindRouteEvent {}

final class StartCountingProcessEvent extends FindRouteEvent {
  String apiUrl;
  StartCountingProcessEvent(this.apiUrl);
}

final class SendResultEvent extends FindRouteEvent {
  List<RouteModel> routes;
  List<FieldInfoModel> fieldInfoModels;
  SendResultEvent(this.routes, this.fieldInfoModels);
}

final class ViewResultsEvent extends FindRouteEvent {
  List<RouteModel> routes;
  List<FieldInfoModel> fieldInfoModels;
  ViewResultsEvent(this.routes, this.fieldInfoModels);
}

final class ViewDetailsOfRouteEvent extends FindRouteEvent {
  List<RouteModel> routeModels;
  List<FieldInfoModel> fieldInfoModels;
  int index;
  ViewDetailsOfRouteEvent(this.routeModels, this.fieldInfoModels, this.index);
}
