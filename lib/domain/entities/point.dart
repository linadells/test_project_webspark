import 'package:equatable/equatable.dart';

class PointEntity extends Equatable{
  final int x,y;
  const PointEntity({required this.x, required this.y});
  
  @override
  String toString() {
    return "($x,$y)";
  }
  
  @override
  List<Object?> get props => [x,y];
}