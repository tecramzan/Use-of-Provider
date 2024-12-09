import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListMapProvider.dart';
import 'package:state_management/Listpage.dart';

import 'provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ChangeCounter()),
    ChangeNotifierProvider(create: (context) => Listmapprovider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Listpage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Counter App with Provider'),
        ),
        body: Center(
          child: Consumer(builder: (ctx, _, __) {
            print('Consumber build function called');
            return Text(
              // '${Provider.of<ChangeCounter>(ctx, listen: true).getCounter()}',
              '${context.watch<ChangeCounter>().getCounter()}',
              style: TextStyle(fontSize: 26, color: Colors.green),
            );
          }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                // Provider.of<ChangeCounter>(context, listen: false).inCrement();
                context.read<ChangeCounter>().inCrement();
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                // Provider.of<ChangeCounter>(context, listen: false).deCrement();
                context.read<ChangeCounter>().deCrement();
              },
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
