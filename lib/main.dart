import 'package:flutter/material.dart';
import 'package:test_project/views/add_demande.dart';
import 'package:test_project/views/demande_page.dart';
import 'views/acceptation.dart';
import 'views/refus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Best Favor',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(
        title: 'Best Favor',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DemandePage demandePage = DemandePage();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('Demandes'),
                ),
                Tab(
                  child: Text('Acceptations'),
                ),
                Tab(
                  child: Text('Refus'),
                ),
              ],
            ),
            centerTitle: true,
            title: Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          body: TabBarView(children: [
            demandePage,
            AcceptationPage(),
            RefusPage(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDemandePage()))
                  .then((value) {
                setState(() {
                  demandePage = DemandePage();
                });
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.edit),
          ),
        ));
  }
}
