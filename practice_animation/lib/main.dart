import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool selected = false;
  bool _bool = true;
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;
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
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Animation: AnimatedAlign..',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
            Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.blueGrey,
                child: AnimatedAlign(
                    duration: Duration(milliseconds: 5000),
                    alignment:
                        selected ? Alignment.topCenter : Alignment.bottomCenter,
                    curve: Curves.bounceInOut,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.red,
                    ))),
            const SizedBox(
              width: double.infinity,
            ),
            
            Text('Animation: AnimatedContainer..',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
            AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.blueGrey : Colors.white,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
            const SizedBox(
              width: double.infinity,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _bool = !_bool;
                  });
                },
                child: const Text('Switch',
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Text('Animation: AnimatedCrossFade..',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
            AnimatedCrossFade(
                firstChild: Icon(Icons.landscape,
                    color: const Color.fromARGB(255, 82, 243, 33), size: 50),
                secondChild: Icon(Icons.add_photo_alternate_sharp,
                    color: const Color.fromARGB(255, 82, 243, 33), size: 50),
                crossFadeState: _bool
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1)),
            Text('Animation: AnimatedCrossFade..',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 120,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: const Text('Flutter'),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _fontSize = _first ? 50 : 30;
                  _color = _first ? Colors.blue : Colors.red;
                  _first = !_first;
                });
              },
              child: const Text(
                "Switch"
              )
            ),
            Text('Animation: AnimatedList..',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                )),
          ],
        )));
  }
}
