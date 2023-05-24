import 'package:flutter/material.dart';
import 'package:fluttertemplates/const/routeprovider.dart';
import 'package:fluttertemplates/pages/dicovermovies.dart';
import 'package:fluttertemplates/service/cartprovider.dart';
import 'package:fluttertemplates/widgets/bottomsheetmodal.dart';
import 'package:fluttertemplates/widgets/collapsable.dart';
import 'package:fluttertemplates/widgets/collapsingappbar.dart';
import 'package:fluttertemplates/widgets/collapsingwidget.dart';
import 'package:fluttertemplates/widgets/flyingjet.dart';
import 'package:fluttertemplates/widgets/fruitmenu.dart';
import 'package:provider/provider.dart';

import 'pages/menu.dart';
import 'widgets/CollapsingAppbarwithTabs.dart';
import 'widgets/HeroAnimation.dart';
import 'widgets/code3.dart';
import 'widgets/fruitOrder.dart';
import 'widgets/searchappbarpage.dart';
import 'widgets/sliders.dart';
import 'widgets/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          routeProvider.animatedAppBar: (context) => CollapsingAppBar(),
          routeProvider.animatedTabbar: (context) => CollapsingAppbarwithTabs(),
          routeProvider.heroAnimation: (context) => HeroAnimation(),
          routeProvider.sliders: (context) => Sliders(),
          routeProvider.tabs: (context) => Tabs(),
          routeProvider.searchappbar: (context) => const SearchAppbarPage(),
          routeProvider.flyingjet: (context) => const FlyingJet(),
          //routeProvider.mangopage: (context) => FruitOrder(),
          routeProvider.fruitmenu: (context) => FruitMenu(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Menu(),
      ),
    );
  }
}
