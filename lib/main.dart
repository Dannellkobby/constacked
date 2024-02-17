import 'package:constacked/app/app.gorouter.dart';
import 'package:flutter/material.dart';
import 'package:constacked/app/app.bottomsheets.dart';
import 'package:constacked/app/app.locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupBottomSheetUi();
  runApp(const MainApp());
}

// The main widget of the app.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // We're using GoRouter for navigation.
      routerConfig: router,
      // Sets up the app's theme.
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          headlineMedium: TextStyle(fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10),
            filled: true
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          backgroundColor: Colors.white,
        ),
      ),
      // Hides the debug banner
      debugShowCheckedModeBanner: false,

    );
  }
}
