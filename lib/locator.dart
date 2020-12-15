import 'package:get_it/get_it.dart';
import 'package:groceries_shop_ui/core/viewModels/homeModel.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  // sl.registerLazySingleton(() => null)
  sl.registerFactory(() => HomeModel());
}
