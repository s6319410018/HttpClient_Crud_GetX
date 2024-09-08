import 'package:httpclient/AppUrl/BaseUri.dart';

class CallUri {
  CallUri._();

  static String getBaseUri() {
    return "${BaseUri.jsonPlaceholder}/users";
  }
}
