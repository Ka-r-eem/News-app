import 'package:flutter/material.dart';
import 'package:news_app/providers/SearchProvider.dart';
import 'package:news_app/ui/home/HomeScreen.dart';
import 'package:news_app/ui/home/categories/ContentScreen.dart';
import 'package:provider/provider.dart';


void main() {
  var provider1 = SearchProvider();

  runApp(
      MultiProvider(


        providers: [
          ChangeNotifierProvider(
              create: (buildContext) => provider1),
        ],
        child:const MyApp(),

      ));}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Theme.of(context).primaryColor,),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF39A552), primary: Color(0xFF39A552)),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            color: Color(0xFF39A552),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)))),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ContentScreen.routeName:(_)=> ContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
