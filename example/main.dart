import 'package:flutter/material.dart';

import 'package:route_transitions_jam/route_transitions_jam.dart';

void main() => runApp(const TansitionRouteApp());

class TansitionRouteApp extends StatelessWidget {
  const TansitionRouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TansitionRoute App',
      initialRoute: 'screen1',
      routes: {
        'screen1': (_) => const Screen1(),
        'screen2': (_) => const Screen2(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          child: const Text('Go to Screen 2'),
          color: Colors.white,
          onPressed: () {
            RouteTransitions(
              context: context,
              child: const Screen2(),
              animation: AnimationType.fadeIn,
              replacement: true,
            );
          },
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
        child: Text('Screen 2'),
      ),
    );
  }
}
