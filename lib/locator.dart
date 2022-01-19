import 'package:get_it/get_it.dart';
import 'package:re_mind_case/views/bill_info_viewmodel.dart';

// providerların listelendiği locator yapısı

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BillInfoViewModel());
}
