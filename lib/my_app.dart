import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/container_injector.dart';
import 'package:taskX/features/auth/presentation/cubit/auth_cubit.dart';

import 'config/app_theme.dart';
import 'core/l10n/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>()..getUser(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeProvider(isLightTheme: true).themeData(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          IntlStrings.delegate,
        ],
        supportedLocales: IntlStrings.delegate.supportedLocales,
        onGenerateRoute: AppRouter.routesGenerator,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocListener<AuthCubit, AuthState>(
              listener: (context, authState) {
                if (authState is AuthSuccessfully && authState.user != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.home,
                    (route) => false,
                    arguments: authState.user,
                  );
                }
                if ((authState is AuthSuccessfully && authState.user == null) ||
                    (authState is AuthFailed)) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.welcome,
                    (route) => false,
                  );
                }
              },
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        },
      ),
    );
  }
}
