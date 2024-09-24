import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trans_go_customer_app/core/config/envs/prod_env.dart';
import 'package:trans_go_customer_app/core/secure_storage/secure_storage.dart';
import 'package:trans_go_customer_app/trans_go_app.dart';


void main() {
  SecureStorage().loadSecureStorage(const FlutterSecureStorage());
  runApp(
    TransGoApp(env: ProdEnv()),
  );
}
