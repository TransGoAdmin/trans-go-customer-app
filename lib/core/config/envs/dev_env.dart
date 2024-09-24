import 'package:trans_go_customer_app/core/config/env.dart';

class DevEnv extends EnvVars {
  @override
  String get apiToken => '';

  @override
  String get baseURL => ''; //devBaseUri;

  @override
  String get title => 'TransGo Dev';

  @override
  String get bearerToken => ''; //devBearerToken;

}
