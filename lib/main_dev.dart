import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trans_go_customer_app/core/config/envs/dev_env.dart';
import 'package:trans_go_customer_app/core/secure_storage/secure_storage.dart';
import 'package:trans_go_customer_app/trans_go_app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  SecureStorage().loadSecureStorage(const FlutterSecureStorage());
  runApp(
    TransGoApp(env: DevEnv()),
  );
}
