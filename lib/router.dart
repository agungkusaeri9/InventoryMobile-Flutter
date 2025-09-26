import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/presentation/pages/dashboard_page.dart';
import 'package:flutter_simple_arch/presentation/pages/auth/login_page.dart';
import 'package:flutter_simple_arch/presentation/pages/message_page.dart';
import 'package:flutter_simple_arch/presentation/pages/product/product_detail_page.dart';
import 'package:flutter_simple_arch/presentation/pages/product/product_page.dart';
import 'package:flutter_simple_arch/presentation/pages/profile_page.dart';
import 'package:flutter_simple_arch/presentation/pages/report_page.dart';
import 'package:flutter_simple_arch/presentation/pages/settings_page.dart';
import 'package:flutter_simple_arch/presentation/pages/splash_screen_page.dart';
import 'package:flutter_simple_arch/presentation/widgets/custom_bottom_navigation.dart';
import 'package:go_router/go_router.dart';
import 'presentation/cubit/auth_cubit.dart';

class AppRouter {
  static GoRouter router(AuthCubit authCubit) {
    return GoRouter(
      initialLocation: "/",
      refreshListenable: GoRouterRefreshStream(authCubit.stream),
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const SplashScreenPage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginPage(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return MainNavScaffold(child: child);
          },
          routes: [
            GoRoute(
              path: "/dashboard",
              builder: (context, state) => const DashboardPage(),
            ),
            GoRoute(
              path: "/profile",
              builder: (context, state) => const ProfilePage(),
            ),
            GoRoute(
              path: "/settings",
              builder: (context, state) => const SettingPage(),
            ),
            GoRoute(
              path: "/reports",
              builder: (context, state) => const ReportsPage(),
            ),
            GoRoute(
              path: "/products",
              builder: (context, state) => const ProductsPage(),
            ),
            GoRoute(
              path: "/messages",
              builder: (context, state) => const MessagesPage(),
            ),
            GoRoute(
              path: "/products/:id",
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ProductDetailPage(productId: id);
              },
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final authState = authCubit.state;
        final goingToSplash = state.matchedLocation == "/";

        if (authState is AuthChecking && !goingToSplash) {
          return "/";
        }

        if (authState is AuthInitial && goingToSplash) {
          return "/login";
        }

        if (authState is AuthSuccess &&
            (state.matchedLocation == "/login" || goingToSplash)) {
          return "/dashboard";
        }
        if (authState is AuthInitial &&
            !goingToSplash &&
            state.matchedLocation != "/login") {
          return "/login";
        }
        return null;
      },
    );
  }
}

/// Helper untuk listen cubit -> go_router
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((event) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
