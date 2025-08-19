part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState()
    : super(
        ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xff9A392C),
          scaffoldBackgroundColor: Color(0xffFFF6DC),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xff9A392C),
            ),
            headlineMedium: TextStyle(fontSize: 20, color: Color(0xff9A392C)),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xff9A392C),
            foregroundColor: Color(0xffFFF6DC),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xffFFF6DC),
            border: OutlineInputBorder(),
           
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff9A392C),
              foregroundColor: Color(0xffFFF6DC),
              minimumSize: const Size(400, 50),
              textStyle: TextStyle(fontSize: 25, color: Color(0xffFFF6DC)),
            ),
          ),
        ),
      );
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
    : super(
        ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xff9A392C),
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xff9A392C),
            ),
            headlineMedium: TextStyle(fontSize: 20, color: Color(0xff9A392C)),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff9A392C),
            foregroundColor: Colors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff9A392C),
              foregroundColor: Colors.white,
            ),
          ),
        ),
      );
}
