
import 'package:weatherapp_usingbloc/core/strings/failleur_strings.dart';

abstract class Error_Msg{
  String get errorMsg;
}

class NoInternetFailure extends Error_Msg {
  @override
  // TODO: implement failureMsg
  String get errorMsg => internetError;
}

//Failure for dio exceptions (i.e timeout, status codes errors)
class TimeoutFailure extends Error_Msg {
  @override
  // TODO: implement failureMsg
  String get errorMsg => serverTimeoutError;
}

class ServerFailure extends Error_Msg {
  @override
  // TODO: implement failureMsg
  String get errorMsg => serverError;
}

class CacheFailure extends Error_Msg {
  @override
  // TODO: implement failureMsg
  String get errorMsg => cacheErrorString;
}

class UndefinedFailure extends Error_Msg {
  @override
  // TODO: implement failureMsg
  String get errorMsg => undefinedFailureString;
}