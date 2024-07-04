import 'package:flutter/material.dart';
import 'package:routingapp/first_page.dart';
import 'package:routingapp/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FirstPage(),
      initialRoute: "/first", // route instead of a widget

      // routes Map
      // routes: {
      //   "/first": (context) => FirstPage(),
      //   "/second": (context) => SecondPage()
      // },

      // onGenerate route
      onGenerateRoute: (settings){
        if(settings.name == "/first"){
          return MaterialPageRoute(builder:(context) {return FirstPage();});
        }

        if(settings.name == "/second"){
          final text = settings.arguments as String;  // typecast required
          return MaterialPageRoute(builder:(context) {return SecondPage(text: text);});
        }

        return null;
      },
    );
  }
}

