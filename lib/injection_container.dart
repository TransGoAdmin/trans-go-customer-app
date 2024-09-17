import 'package:get_it/get_it.dart';
import 'package:trans_go_customer_app/core/network/dio_client.dart';
import 'package:trans_go_customer_app/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

  // Dio Client
  sl.registerLazySingleton<DioClient>(() => DioClient());
}
