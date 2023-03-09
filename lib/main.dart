import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';
import 'package:taskX/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.light(),
      theme: ThemeData(fontFamily: "Metropolis"),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        IntlStrings.delegate,
      ],
      supportedLocales: IntlStrings.delegate.supportedLocales,
      home: const HomeScreen(),
    );
  }
}
