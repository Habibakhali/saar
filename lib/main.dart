import 'package:elrayan/belux.dart';
import 'package:elrayan/saar.dart';
import 'package:elrayan/zord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
MaterialColor myColor = MaterialColor(0xFF4F6F52, {
  50: Color.fromRGBO(79, 111, 82, 0.1),
  100: Color.fromRGBO(79, 111, 82, 0.2),
  200: Color.fromRGBO(79, 111, 82, 0.3),
  300: Color.fromRGBO(79, 111, 82, 0.4),
  400: Color.fromRGBO(79, 111, 82, 0.5),
  500: Color.fromRGBO(79, 111, 82, 0.6),
  600: Color.fromRGBO(79, 111, 82, 0.7),
  700: Color.fromRGBO(79, 111, 82, 0.8),
  800: Color.fromRGBO(79, 111, 82, 0.9),
  900: Color.fromRGBO(79, 111, 82, 1.0),
});
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale('ar'),
      ],
      theme:ThemeData(
        primarySwatch: myColor,
        primaryColorLight: const Color.fromRGBO(79, 111, 82, 1.0),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:  Color.fromRGBO(79, 111, 82, 1.0),
          foregroundColor:  Color.fromRGBO(245, 239, 230, 1.0),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(245, 239, 230, 1.0),
        appBarTheme: const AppBarTheme(
          backgroundColor:   Color.fromRGBO(79, 111, 82, 1.0),
          centerTitle: true,
        ),
      ),
      initialRoute: HomeScreen.routeNAme,
      routes: {
        HomeScreen.routeNAme:(_)=>HomeScreen(),
        Zord.routeName:(_)=>Zord(),
      },
    );
  }
}
