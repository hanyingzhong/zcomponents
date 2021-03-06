```dart
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:z_components/components/z-alert-dialog.dart';
import 'package:z_components/components/z-float-button.dart';
import 'package:z_components/config/z-button-type.dart';
import 'package:z_components/config/z-platform.dart';
import 'package:z_components/config/z-mask.dart';
import 'package:z_components/config/z-dialog.dart';
import 'package:z_components/components/z-size.dart';
import 'package:z_components/components/z_switch.dart';
import 'package:z_components/components/z_picker.dart';
import 'package:z_components/components/z_tabbar.dart';
import 'package:z_components/components/z_button.dart';
import 'package:z_components/components/z_loading.dart';
import 'package:z_components/components/z-baseline.dart';
import 'package:z_components/components/z_navigationbar.dart';
import 'package:z_components/components/z_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff2BBAB4),
        accentColor: const Color(0xff2BBAB4),
        splashColor: const Color(0xff2BBAB4),
      ),
      home: ChangeNotifierProvider<AppSwitch>(
          builder: (_) => AppSwitch(), child: Home()),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate, // if it's a RTL language
      ],
      supportedLocales: [
        if (Platform.isIOS) const Locale('en', 'US'),
        if (Platform.isAndroid) const Locale('pt', 'BR'),
      ],
    );
  }
}

class Home extends StatelessWidget {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final appSwitch = Provider.of<AppSwitch>(context);

    return Scaffold(
      floatingActionButton: ZFloatButton(
        onPressed: () {},
      ),
      appBar: new ZNavigationBar(
        //middle: IOS
        middle: new Text(
          "ZComponets",
          style: new TextStyle(color: Colors.white),
        ),
        //title: ANDROID
        title: new Text(
          "ZComponets",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Column(children: <Widget>[
            new ZBaseLine(
              context: context,
              title: "Nome:",
              ztextField: new ZTextField(
                  //onChanged: (text) => appSwitch.text = text,
                  ),
            ),
            new ZBaseLine(
              context: context,
              title: "Sobrenome:",
              ztextField: new ZTextField(
                  //onChanged: (text) => appSwitch.text = text,
                  ),
            ),
            new ZBaseLine(
              context: context,
              title: "CPF:",
              ztextField: new ZTextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                zMask: ZMask.isCPF,
                //onChanged: (text) => appSwitch.text = text,
              ),
            ),
            new Container(
              child: ZTextField(
                onChanged: (text) => appSwitch.text = text,
              ),
              padding: EdgeInsets.all(8),
            ),
            ZSwitch(
                value: appSwitch.value,
                onChanged: (b) {
                  appSwitch.value = b;
                }),
            ZButton(
                zButtonType: ZButtonType.isContained,
                text: 'Contained',
                onPressed: () {
                  new ZPicker(
                    context: context,
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2090),
                    firstDate: DateTime(1090),
                    onTimerDurationChanged: (date) {
                      date;
                    },
                  );
                }),
            ZButton(
                zButtonType: ZButtonType.isOutlined,
                onPressed: () {
                  new ZPicker(
                    context: context,
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2090),
                    firstDate: DateTime(1090),
                    onTimerDurationChanged: (date) {
                      date;
                    },
                  );
                },
                text: "Outlined"),
            new ZSize(
              context: context,
              child: ZButton(
                text: "Dialog",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => ZAlertDialog(
                          zDialog: ZDialog.alert,
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Container(
                                    margin: const EdgeInsets.only(top: 12,bottom: 12),
                                    alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                    child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Text("Uma empresa já possui seu cadastro",style: new TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                        new Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child:new Text("Deseja se vincular à empresa abaixo?",style: new TextStyle(color: Color(0xfff707070),fontWeight: FontWeight.normal,fontSize: 13),),

                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(top: 6),
                                          child:new Text("",style: new TextStyle(color: Color(0xfff707070),fontWeight: FontWeight.normal,fontSize: 13),),

                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Container(
                                    height: 1,
                                    width: 280,
                                    color: Color(0xffe0e0e0),
                                  )
                                ],
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 0),
                                      child: new ButtonTheme(
                                        minWidth: 100,
                                        child: new RaisedButton(
                                            elevation: 0.0,
                                            color: Colors.white,
                                            child: new Text(
                                              "NÃO VINCULAR",
                                              style: new TextStyle(
                                                  color: Color(0xff707070),
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(30.0))),
                                      )),
                                  new Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 0),
                                      child: new ButtonTheme(
                                        minWidth: 100,
                                        child: new RaisedButton(
                                            elevation: 0.0,
                                            color: Colors.white,
                                            child: new Text(
                                              "VINCULAR",
                                              style: new TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(30.0))),
                                      )),
                                ],
                              ),
                            ],
                          )
                      ));
                },
              ),
              quadrado: false,
              percentWidth: 90,
              percentHeight: 10,
              maxHeight: 30,
            ),
            new ZLoading(
              zPlatform: ZPlatform.isAndroid,
            ),
            Text(appSwitch.text),
          ]),
        ],
      ),
      bottomNavigationBar: ZtabBar(
        backgroundColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        onTap: (index) => this.index = index,
        currentIndex: 0,
        iconSize: 16,
        inactiveColor: Colors.red,
        activeColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        // currentIndex: _selectedIndex,
      ),
    );
  }
}

class AppSwitch with ChangeNotifier {
  AppSwitch();

  bool _value = false;
  String _text = "";

  set value(bool text) {
    _value = text;
    notifyListeners();
  }

  bool get value => _value;

  set text(String text) {
    _text = text;
    notifyListeners();
  }

  String get text => _text;
}
```