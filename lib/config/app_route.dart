import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskX/container_injector.dart';
import 'package:taskX/features/auth/presentation/screens/welcome_screen.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';
import 'package:taskX/features/credential/presentation/screens/choose_login_method_screen.dart';
import 'package:taskX/features/credential/presentation/screens/sign_in_screen.dart';
import 'package:taskX/features/credential/presentation/screens/sign_up_screen.dart';
import 'package:taskX/features/home/presentation/screens/home_screen.dart';

class Routes {
  Routes._();
  static const String welcome = "/welcome";
  static const String chooseLoginMethod = "/chooseLoginMethod";
  static const String signUp = "/signUp";
  static const String home = "/home";
  static const String signIn = "/signIn";
}

class AppRouter {
  AppRouter._();
  static final _credentialCubit = sl<CredentialCubit>();

  static Route<dynamic>? routesGenerator(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CredentialCubit>(
            create: (context) => _credentialCubit,
            child: const WelcomeScreen(),
          ),
        );

      case Routes.chooseLoginMethod:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CredentialCubit>.value(
            value: _credentialCubit,
            child: const ChooseLoginMethodScreen(),
          ),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CredentialCubit>.value(
            value: _credentialCubit,
            child: const SignUpScreen(),
          ),
        );

      case Routes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CredentialCubit>.value(
            value: _credentialCubit,
            child: const SignInScreen(),
          ),
        );

      case Routes.home:
        return routeBuilder(HomeScreen(user: args as UserEntity));
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text("No Route Found")),
      );
}
