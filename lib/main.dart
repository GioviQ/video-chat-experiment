import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:video_chat_experiment/src/video_chat.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';
import 'localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Video chat experiment'),
      supportedLocales: [
        const Locale('en'), // English
        const Locale('it')
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _nickName = '';

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(AppLocalizations.of(context).title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: new SizedBox(
          width: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(AppLocalizations.of(context).insertNickname,
                  style: TextStyle(fontSize: 20.0)),
              TextField(
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(32),
                  ],
                  onChanged: (String text) {
                    setState(() {
                      _nickName = text.trim();
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    if (_nickName.isNotEmpty)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VideoChat(displayName: _nickName)));
                  },
                  child: Text(AppLocalizations.of(context).start,
                      style: TextStyle(fontSize: 20.0)),
                ),
              ),
            ],
          ),
        )));
  }
}
