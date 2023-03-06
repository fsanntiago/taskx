import 'package:flutter/material.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [IntlStrings.delegate],
      supportedLocales: IntlStrings.delegate.supportedLocales,
    );
  }
}
