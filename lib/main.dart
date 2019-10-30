import 'package:flutter/material.dart';
import 'package:quick_note/views/alpha_view.dart';

void main() => runApp(QuickNote());

class QuickNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.blue[800],
          fontFamily: 'Roboto',
        ),
        title: 'quick note',
        home: Scaffold(
              appBar: AppBar(
              title: Text(
                "QN",
                style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 30,color: Colors.amber),
              ),
            ), 
            backgroundColor: Color(0xFF303030),
            body: Column(children: <Widget>[
              Text(
                "QN",
                style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 30,color: Colors.amber),
              ),
              Container(child: AlphaView()),
            ]),
            floatingActionButton: AddButton()));
  }
}
