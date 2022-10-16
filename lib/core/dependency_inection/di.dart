import 'package:get_it/get_it.dart';
import 'package:weatherapp_usingbloc/features/injection_container.dart' as weather;

final get = GetIt.instance;

void init() {
  weather.init();
}