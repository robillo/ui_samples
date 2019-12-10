import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI SAMPLES',
      home: HomePage(title: 'UI Samples'),
    );
  }
}

class HomePage extends StatelessWidget {

  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0, bottom: 40.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF00194A), Color(0xFF000318)]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "UI SAMPLES",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDDDEE0)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Text(
                "FOR FLUTTER",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF858C9F)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0, bottom: 15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF08234E),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      )
                  ),
                  child: Center(
                    child: Text(
                      "Pick a UI category to get started!",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFCCD9FF)
                      ),
                    ),
                  )
                ),
              ),
            ),
            Expanded(
              child: Text(""),
            ),
            Center(
              child: Text(
                "Tathastu by Robin Kamboj",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF6C758D)
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}