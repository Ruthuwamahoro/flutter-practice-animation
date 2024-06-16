import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

            width: double.infinity,
            height: 250.0,
            color: Colors.blueGrey,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 5000),
              alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
              curve: Curves.bounceInOut,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
              )
            )
            ),
            const SizedBox(height: 20.0),
            AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.blueGrey : Colors.white,
                alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: const Duration(seconds:2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 75),
              )
          ],
        )
      )
    );
  }
}

