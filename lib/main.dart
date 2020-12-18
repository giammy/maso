import 'package:flutter/material.dart';
import 'package:maso/pages.dart';
import 'package:provider/provider.dart';
import 'package:maso/modelStato.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;


void main() {
  //debugPaintSizeEnabled = true;
  runApp(
      ChangeNotifierProvider(
        create: (context) => StatoModel(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Maso'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Persone'),
    Tab(text: 'Magazzino'),
    Tab(text: 'Assegnazioni'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: const Text('MASO'),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
        ),
      );


  }
}

