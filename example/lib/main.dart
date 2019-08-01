import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:z_components/components/z-float-button.dart';
import 'package:z_components/components/z-nome-reduzido.dart';
import 'package:z_components/components/z-sequencia/z-sequencia.dart';
import 'package:z_components/components/z_loading.dart';
import 'package:z_components/components/z_tabbar.dart';
import 'package:z_components/components/z-collection.dart';
import 'package:z_components/components/z-collection-item.dart';
import 'package:z_components/components/z-cargo.dart';
import 'package:z_components/components/z-escala.dart';
import 'package:z_components/components/z-baseline.dart';
import 'package:z_components/components/z_navigationbar.dart';
import 'package:z_components/components/z-instrucao-batida.dart';
import 'package:flutter/cupertino.dart';
import 'package:z_components/config/z-tipos-baseline.dart';
import 'package:z_components/components/z_button.dart';
import 'package:z_components/components/z-perfil.dart';
import 'package:z_components/components/z-alert-dialog.dart';
import 'package:z_components/components/z-hora-padrao.dart';
import 'package:z_components/components/zp-grafico.dart';
import 'package:z_components/components/z-expendable-item-tile.dart';
import 'package:z_components/components/z-tile.dart';
import 'package:z_components/config/z-dialog.dart';
import 'package:z_components/components/z_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: ComponentExemploClasse()),
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
          onTap: (index) => index = index,
          currentIndex: 0,
          iconSize: 16,
          inactiveColor: Colors.black,
          activeColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black45,
          // currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class ComponentExemploClasse extends StatefulWidget {
  @override
  _ComponentExemploClasseState createState() => _ComponentExemploClasseState();
}

class _ComponentExemploClasseState extends State<ComponentExemploClasse> {
  var controllerEmail = new TextEditingController();
  var controllerNome = new TextEditingController();
  var controllerCPF = new TextEditingController();
  var controllerCelular = new TextEditingController();
  var controllerData = new TextEditingController();
  var controllerSenha = new TextEditingController();
  var controllerRepetirSenha = new TextEditingController();
  var controllerRua = new TextEditingController();
  var controllerCEP = new TextEditingController();
  var controllerCNPJ = new TextEditingController();
  var controllerNumero = new TextEditingController();

  FocusNode nomeFocus;
  FocusNode emailFocus;
  FocusNode cpfFocus;
  FocusNode celularFocus;
  FocusNode mesFocus;
  FocusNode ruaFocus;
  FocusNode numeroFocus;
  FocusNode cEPFocus;
  FocusNode cNPJFocus;

  bool value = false;
  ZBaseLine valideNome;
  ZBaseLine valideCPF;
  ZBaseLine valideData;
  ZBaseLine valideEmail;
  ZBaseLine valideCelular;
  bool isSwitched = true;

  var _controllerFim = new TextEditingController();
  var _controllerIntervalo = new TextEditingController();
  var _controllerHorarioInicio = new TextEditingController();

  var _keyEscala = new GlobalKey<ZEscalaState>();

  var _keyCargo = new GlobalKey<ZCargoState>();

  String vp;
  var _keyStatus = new GlobalKey<ZCollectionState>();

  String _value = "open";

  List<String> titulos = [
    "Lista de Documentos",
    "Espelho de Ponto",
    "Gestão de Ponto",
    "Atestados",
    "Histórico Alocações",
    "Histórico Status",
    "Histórico FériasHistórico Férias",
    "Histórico Afastamento",
    "Dependentes"
  ];
  List<IconData> icones = [
    Icons.assignment,
    Icons.list,
    Icons.add_to_home_screen,
    Icons.attach_file,
    Icons.fastfood,
    Icons.add_circle_outline,
    Icons.backup,
    Icons.voice_chat,
    Icons.view_stream
  ];

  List<dynamic> listaOnTap = [
    () {
      print("1");
    },
    () {
      print("2");
    },
    () {
      print("3");
    },
    () {
      print("4");
    },
    () {
      print("5");
    },
    () {
      print("6");
    },
    () {
      print("7");
    },
    () {
      print("8");
    },
    () {
      print("9");
    },
  ];

  @override
  void initState() {
    nomeFocus = new FocusNode();
    emailFocus = new FocusNode();
    cpfFocus = new FocusNode();
    celularFocus = new FocusNode();
    mesFocus = new FocusNode();
    ruaFocus = new FocusNode();
    numeroFocus = new FocusNode();
    cEPFocus = new FocusNode();
    cNPJFocus = new FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: ZFloatButton(
          onPressed: () {},
        ),
        appBar: ZNavigationBar(
          leading: new Icon(Icons.print),
          middle: new Container(
            child: new Text('teste'),
          ),
          trailing: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new InformacaoBatida(
                          bottomChild: new Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 5),
                              child: new ButtonTheme(
                                minWidth: 145,
                                child: new RaisedButton(
                                    color: Color(0xff2bbab4),
                                    child: new Text(
                                      "ENTENDI",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0))),
                              )),
                        )),
              );
            },
            child: new Container(
              child: new Icon(
                Icons.info,
                color: Colors.blue,
                size: 19.0,
              ),
            ),
          ),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ZSequencia(
                    token:
                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjZmYWI2Yjk3LTkyMjctNGUyOS05MzVhLTM5ZjNmN2E4Y2E1ZiIsImFjY291bnQiOiJaZWxsYXJUZW5hbnQiLCJpZEFjY291bnQiOiI5YzZlZDk2ZC1iODM1LTQzNGEtOWE0My01NmNhMjFiZDg0YzEiLCJuYmYiOjE1NjM0ODA5NzYsImV4cCI6MTU2NDA4NTc3NiwiaWF0IjoxNTYzNDgwOTc2fQ.xK3ROTSn6rP-9ODwGou4wA5mwa4vgeC5gGqyigMIix4",
                    idConta: "486A49B3-47D1-4D76-80DF-079EB82D6D8F",
                    idColaborador: "548D524D-A6DE-4D8A-945E-A706AD2F87F2",
                  )
                ],
              ),
            ),
            ZBaseLine(
              zTipos: ZTipoBaseline.isDataNascimento,
              controllerData: controllerData,
              context: context,
              mesFocus: mesFocus,
            ),
            ZBaseLine(
              zTipos: ZTipoBaseline.isCNPJ,
              cNPJFocus: cNPJFocus,
              controllerCNPJ: controllerCNPJ,
              context: context,
            ),
            new ZNomeReduzido(
              text: "Giuliano Ortiz Goria",
              textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
            new ZCargo(
              token:
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjZmYWI2Yjk3LTkyMjctNGUyOS05MzVhLTM5ZjNmN2E4Y2E1ZiIsImFjY291bnQiOiJaZWxsYXJUZW5hbnQiLCJpZEFjY291bnQiOiI5YzZlZDk2ZC1iODM1LTQzNGEtOWE0My01NmNhMjFiZDg0YzEiLCJuYmYiOjE1NjM0ODA5NzYsImV4cCI6MTU2NDA4NTc3NiwiaWF0IjoxNTYzNDgwOTc2fQ.xK3ROTSn6rP-9ODwGou4wA5mwa4vgeC5gGqyigMIix4",
              key: _keyCargo,
            ),
            new ZEscala(
              token:
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjZmYWI2Yjk3LTkyMjctNGUyOS05MzVhLTM5ZjNmN2E4Y2E1ZiIsImFjY291bnQiOiJaZWxsYXJUZW5hbnQiLCJpZEFjY291bnQiOiI5YzZlZDk2ZC1iODM1LTQzNGEtOWE0My01NmNhMjFiZDg0YzEiLCJuYmYiOjE1NjM0ODA5NzYsImV4cCI6MTU2NDA4NTc3NiwiaWF0IjoxNTYzNDgwOTc2fQ.xK3ROTSn6rP-9ODwGou4wA5mwa4vgeC5gGqyigMIix4",
              key: _keyEscala,
              //valorPadrao: widget.escala,
            ),
            new ZCollection(
              key: _keyStatus,
              titulo: "Status*",
              //valorPadrao: valorPadraoStatus,
              lista: ["Ativo", "Inativo"]
                  .map(
                      (x) => new ZCollectionItem(chave: x, titulo: x, valor: x))
                  .toList(),
              onChange: (item) {},
            ),
            new Row(
              children: <Widget>[
                new ZButton(
                  text: "PERFIL",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ZPerfil(
                                onTapVoltar: () {
                                  Navigator.of(context).pop();
                                },
                                listaIcones: icones,
                                listaTextos: titulos,
                                numeroQuadrados: 6,
                                statusInfo: true,
                                tituloHeader: "Giuliano Ortiz",
                                textoTituloInfo: "Giuliano Ortiz",
                                textoLocalInfo: "Sede - Xolis ltda.",
                                textoCargoInfo: "Garoto de TI",
                                textoEscalaInfo: "5x2(seg-sex)",
                                textoHoraEntradaInfo: "09:00",
                                textoHoraSaidaInfo: "15:30",
                                textoHoraIntervaloInfo: "1:00",
                                textoCodigoInfo: "012345",
                                listaOnTap: listaOnTap,
                              )),
                    );
                  },
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                ZLoading(
                  color: Colors.purple,
                ),
                ZLoading(
                  color: Colors.lightBlueAccent,
                ),
                ZLoading(
                  color: Colors.lightGreenAccent,
                ),
                ZLoading(
                  color: Colors.amber,
                ),
              ],
            ),
            new ZHora(
              controllerIntervalo: _controllerIntervalo,
              controllerHoraSaida: _controllerFim,
              controllerHoraEntrada: _controllerHorarioInicio,
            ),
            new Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: new ZPGrafico(),
            ),
            new ZExpendableItemTile(),
            new Container(
              width: 50.0,
              child: new Icon(Icons.search),
            ),
            new ZTile(
                leading: new Text("Z TILE TEXT KKKKKKkkkkkkkkkkkkkkkkkkkk",
                    style: TextStyle(color: Color(0xFF000000), fontSize: 14.0)),
                trailing: new Row(
                  children: <Widget>[
                    new GestureDetector(
                      child: new Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFC4C4C4),
                      ),
                      onTap: () {
                        print('teste');
                      },
                    )
                  ],
                )),
            new Container(
              width: 50.0,
              child: new Icon(Icons.search),
            ),
            new Column(
              children: <Widget>[
                new ZButton(
                  text: "Dialog Normal",
                  onPressed: () {
                    showAlertDialogNewNormal();
                  },
                ),
                new ZButton(
                  text: "Dialog Erro",
                  onPressed: () {
                    showAlertDialogNew();
                  },
                ),
                new ZButton(
                  text: "Dialgo Alert",
                  onPressed: () {
                    showAlertDialogNewAlert();
                  },
                ),
                new ZButton(
                  text: "Dialog Succes",
                  onPressed: () {
                    showAlertDialogNewSuccess();
                  },
                ),
                new ZButton(
                  text: "Dialog Load",
                  onPressed: () {
                    showAlertDialogNewProgress();
                  },
                ),
              ],
            ),
          ],
        ));
  }

  void showAlertDialogNew() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.erro,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(20),
                        child: new Text(
                          "Dialog Test",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Este aqui eh um dialogo teste de um tipo",
                                style: new TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: const Color(0xffdbdbdb),
                  ),
                  new Container(
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      splashColor: const Color(0xffe6e6e6),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(12),
                        child: new Text(
                          "ENTENDI",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ));
  }

  void showAlertDialogNewAlert() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.alert,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(20),
                        child: new Text(
                          "Dialog Test",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Este aqui eh um dialogo teste de um tipo",
                                style: new TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: const Color(0xffdbdbdb),
                  ),
                  new Container(
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      splashColor: const Color(0xffe6e6e6),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(12),
                        child: new Text(
                          "ENTENDI",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ));
  }

  void showAlertDialogNewSuccess() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.sucess,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(20),
                        child: new Text(
                          "Dialog Test",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Este aqui eh um dialogo teste de um tipo",
                                style: new TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: const Color(0xffdbdbdb),
                  ),
                  new Container(
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      splashColor: const Color(0xffe6e6e6),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(12),
                        child: new Text(
                          "ENTENDI",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ));
  }

  void showAlertDialogNewNormal() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.normal,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(20),
                        child: new Text(
                          "Dialog Test",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Este aqui eh um dialogo teste de um tipo",
                                style: new TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: const Color(0xffdbdbdb),
                  ),
                  new Container(
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      splashColor: const Color(0xffe6e6e6),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(12),
                        child: new Text(
                          "ENTENDI",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ));
  }

  void showAlertDialogNewProgress() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.linearLoad,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(20),
                        child: new Text(
                          "Dialog Test",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Este aqui eh um dialogo teste de um tipo",
                                style: new TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: const Color(0xffdbdbdb),
                  ),
                  new Container(
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      splashColor: const Color(0xffe6e6e6),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(12),
                        child: new Text(
                          "ENTENDI",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ));
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
