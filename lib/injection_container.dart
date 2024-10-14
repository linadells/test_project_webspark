import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
  
Future<void> initializeDependencies() async {
  try {
   sl.registerSingleton<Dio>(Dio());
  } catch (e) {
    print("Error during dependency registration: $e");
  }
}