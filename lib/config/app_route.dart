import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskX/container_injector.dart';
import 'package:taskX/features/auth/presentation/screens/welcome_screen.dart';
import 'package:taskX/features/category/presentation/cubit/category_cubit.dart';
import 'package:taskX/features/category/presentation/screens/create_category_screen.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';
import 'package:taskX/features/credential/presentation/screens/choose_login_method_screen.dart';
import 'package:taskX/features/credential/presentation/screens/sign_in_screen.dart';
import 'package:taskX/features/credential/presentation/screens/sign_up_screen.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskX/features/home/presentation/screens/home_screen.dart';
import 'package:taskX/features/task/presentation/screens/create_task_screen.dart';

import '../core/domain/entities/user/entities/user_entity.dart';
import '../features/home/presentation/widgets/category/categories_builder.dart';

class Routes {
  Routes._();
  static const String welcome = "/welcome";
  static const String chooseLoginMethod = "/chooseLoginMethod";
  static const String signUp = "/signUp";
  static const String home = "/home";
  static const String signIn = "/signIn";
  static const String createTask = "/createTask";
  static const String createCategory = "/createCategory";
  static const String categories = "/categories";
}

class AppRouter {
  AppRouter._();
  static final _credentialCubit = sl<CredentialCubit>();
  static final _categoryCubit = sl<CategoryCubit>();

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
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => sl<HomeCubit>()..homeLoadCategories(),
              ),
              BlocProvider<CategoryCubit>.value(value: _categoryCubit),
            ],
            child: HomeScreen(user: args as UserEntity),
          ),
        );

      case Routes.createTask:
        return MaterialPageRoute(
          builder: (context) => const CreateTaskScreen(),
        );

      case Routes.createCategory:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CategoryCubit>.value(
            value: _categoryCubit..isInCategoryLimit(),
            child: const CreateCategoryScreen(),
          ),
        );

      case Routes.categories:
        // return MaterialPageRoute(
        //   builder: (context) => BlocProvider<CategoryCubit>(
        //     create: (context) => sl<CategoryCubit>()..isInCategoryLimit(),
        //     child: const CreateCategoryScreen(),
        //   ),
        // );
        return MaterialPageRoute(
            builder: (context) => const CategoriesBuilder());

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
