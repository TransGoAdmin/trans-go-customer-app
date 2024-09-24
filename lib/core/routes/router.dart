import 'package:go_router/go_router.dart';
import 'package:trans_go_customer_app/features/dashboard/presentation/page/dashboard_page.dart';
import 'package:trans_go_customer_app/features/otp/presentation/page/otp_page.dart';
import 'package:trans_go_customer_app/features/splash/presentation/page/splash_page.dart';
import 'route_path.dart';

import 'package:trans_go_customer_app/features/login/presentation/pages/login_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.SPLASH,
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      name: Routes.LOGIN,
      path: '/${Routes.LOGIN}',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: Routes.DASHBOARD,
      path: '/${Routes.DASHBOARD}',
      builder: (context, state) => DashboardPage(),
    ),
    GoRoute(
      name: Routes.OTP,
      path: '/${Routes.OTP}',
      builder: (context, state) => OtpPage(),
    ),
  ],
);
