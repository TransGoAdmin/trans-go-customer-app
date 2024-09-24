import 'package:trans_go_customer_app/core/config/env.dart';

class ProdEnv extends EnvVars {
  @override
  String get apiToken => '';

  @override
  String get baseURL => ''; //prodBaseUri;

  @override
  String get title => 'TransGo';

  @override
  String get bearerToken => ''; //prodBearerToken;
}
