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

final class ViewDetailsOfRouteEvent extends FindRouteEvent {
  RouteModel routeModel;
  FieldInfoModel fieldInfoModel;
  ViewDetailsOfRouteEvent(this.routeModel, this.fieldInfoModel);
}
