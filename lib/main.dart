
import 'package:flutter/material.dart';
import 'package:news_app/providers/ColorProvider.dart';
import 'package:news_app/providers/SearchProvider.dart';
import 'package:news_app/ui/home/HomeScreen.dart';
import 'package:news_app/ui/home/categories/ContentScreen.dart';
import 'package:provider/provider.dart';


void main() {
  var provider1 = SearchProvider();
  var provider2 = ColorProvider();

  runApp(
      MultiProvider(


        providers: [
          ChangeNotifierProvider(
              create: (buildContext) => provider1),
          ChangeNotifierProvider(
              create: (buildContext) => provider2),
        ],
        child: MyApp(),

      ));}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Theme.of(context).primaryColor,),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF39A552), primary:colorProvider.color ),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "KOUFIBD"
            ),
            color: colorProvider.color,
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
