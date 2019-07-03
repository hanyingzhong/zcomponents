import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:z_components/components/z-alert-dialog.dart';
import 'package:z_components/components/z-size.dart';
import 'package:z_components/config/z-dialog.dart';
import 'package:z_components/config/z-horario-tye.dart';
import 'package:z_components/config/z-tipos-baseline.dart';

class ZHora extends StatelessWidget {
  Widget _zHora;

  final Key key;
  final BuildContext context;
  final ZHorario zHora;

  FocusNode _focusEntrada;
  FocusNode _focusSaida;
  FocusNode _focusIntervalo;

  String _horaEntrada;
  String _minutoEntrada;
  int _intHoraEntrada;
  int _intMinutoEntrada;


  String _horaSaida;
  String _minutoSaida;
  int _intHoraSaida;
  int _intMinutoSaida;


  String _horaIntervalo;
  String _minutoIntervalo;
  int _intHoraIntervalo;
  int _intMinutoIntervalo;


  ZHora(
      {this.key,  @required this.context, this.zHora = ZHorario.isNormal})
      : super(key: key) {
    init();
    switch (zHora) {
      case ZHorario.isPadrao:
        _zHora = new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 18),

                    child: new Text("Hora Entrada:"),
                  ),
                  new Text("Hora Saída:"),
                  new Container(
                    margin: EdgeInsets.only(right: 18),
                    child: new Text("Hora Intervalo:"),
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Expanded(
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(5.0)),
                                  ),
                                  child: new Container(
                                      margin: EdgeInsets.only(left: 30.0),
                                      child: new TextField(
                                        onSubmitted: (term) {
                                          _fieldFocusChange(context, _focusEntrada, _focusSaida);
                                        },
                                        inputFormatters: [
                                          MaskedTextInputFormatterShifter(
                                              maskONE: "XX:XX", maskTWO: "XX:XX"),
                                          BlacklistingTextInputFormatter(RegExp("[/\\\\,.-]")),

                                        ],
                                        focusNode: _focusEntrada,
                                        keyboardType: TextInputType.number,
                                        //controller: _binding.controllerHorarioInicio,
                                        decoration: InputDecoration.collapsed(hintText: ""),
                                        onChanged: (text) {
                                          _horaEntrada = text.substring(0, 2);
                                          _minutoEntrada = text.substring(3, 5);
                                          _intHoraEntrada = int.parse(_horaEntrada);
                                          _intMinutoEntrada = int.parse(_minutoEntrada);
                                      if(text.length == 5)
                                      {
                                        if(_intHoraEntrada > 23 && _intMinutoEntrada > 59)
                                        {
                                          showAlertDialogNew("Horario Inválido!", "Por favor insira um valor de hora entre 00 e 23 e um minuto de 00 a 59.");
                                        }
                                       else if(_intHoraEntrada > 23 && _intMinutoEntrada < 59)
                                        {
                                          showAlertDialogNew("Hora Inválida!", "Por favor insira um valor de hora entre 00 e 23.");
                                        }
                                        else if(_intHoraEntrada < 24 && _intMinutoEntrada > 59)
                                        {
                                          showAlertDialogNew("Minuto Inválido!", "Por favor insira um valor de minuto entre 00 e 59.");
                                        }
                                        else{
                                          _fieldFocusChange(context, _focusEntrada, _focusSaida);
                                        }
                                      }


                                        },
                                      )),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  margin: EdgeInsets.only(right: 10,left: 10),
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(5.0)),
                                  ),
                                  child: new Container(
                                      margin: EdgeInsets.only(left: 30.0),
                                      child: new TextField(
                                        inputFormatters: [
                                          MaskedTextInputFormatterShifter(
                                              maskONE: "XX:XX", maskTWO: "XX:XX"),
                                          BlacklistingTextInputFormatter(RegExp("[/\\\\,.-]")),

                                        ],
                                        focusNode: _focusSaida,
                                        keyboardType: TextInputType.number,
                                        //controller: _binding.controllerFim,
                                        decoration: InputDecoration.collapsed(hintText: ""),
                                        onChanged: (text) {
                                          _horaSaida = text.substring(0, 2);
                                          _minutoSaida = text.substring(3, 5);
                                          _intHoraSaida = int.parse(_horaSaida);
                                          _intMinutoSaida = int.parse(_minutoSaida);
                                          if(text.length == 5)
                                          {
                                            if(_intHoraSaida > 23 && _intMinutoSaida > 59)
                                            {
                                              showAlertDialogNew("Horario Inválido!", "Por favor insira um valor de hora entre 00 e 23 e um minuto de 00 a 59.");
                                            }
                                            else if(_intHoraSaida > 23 && _intMinutoSaida < 59)
                                            {
                                              showAlertDialogNew("Hora Inválida!", "Por favor insira um valor de hora entre 00 e 23.");
                                            }
                                            else if(_intHoraSaida < 23 && _intMinutoSaida > 59)
                                            {
                                              showAlertDialogNew("Minuto Inválido!", "Por favor insira um valor de minuto entre 00 e 59.");
                                            }
                                            else {
                                              _fieldFocusChange(context, _focusSaida, _focusIntervalo);
                                            }
                                          }


                                        },
                                      )),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(5.0)),
                                  ),
                                  child: new Container(
                                      margin: EdgeInsets.only(left: 30.0),
                                      child: new TextField(
                                        focusNode: _focusIntervalo,
                                        inputFormatters: [
                                          MaskedTextInputFormatterShifter(
                                              maskONE: "XX:XX", maskTWO: "XX:XX"),
                                          BlacklistingTextInputFormatter(RegExp("[/\\\\,.-]")),

                                        ],
                                        keyboardType: TextInputType.number,
                                       // controller: _binding.controllerIntervalo,
                                        decoration: InputDecoration.collapsed(hintText: ""),
                                        onChanged: (text) {
                                          _horaIntervalo = text.substring(0, 2);
                                          _minutoIntervalo = text.substring(3, 5);
                                          _intHoraIntervalo = int.parse(_horaIntervalo);
                                          _intMinutoIntervalo = int.parse(_minutoIntervalo);

                                          if(text.length == 5)
                                          {
                                            horarioTrabalhado();
                                            if(_intHoraIntervalo > 23 && _intMinutoIntervalo > 59)
                                            {
                                              showAlertDialogNew("Horario Inválido!", "Por favor insira um valor de hora entre 00 e 23 e um minuto de 00 a 59.");
                                            }
                                            else if(_intHoraIntervalo > 23 && _intMinutoIntervalo < 59)
                                            {
                                              showAlertDialogNew("Hora Inválida!", "Por favor insira um valor de hora entre 00 e 23.");
                                            }
                                            else if(_intHoraIntervalo < 23 && _intMinutoIntervalo > 59)
                                            {
                                              showAlertDialogNew("Minuto Inválido!", "Por favor insira um valor de minuto entre 00 e 59.");
                                            }
                                            else{
                                              FocusScope.of(context).requestFocus(new FocusNode());
                                            }
                                          }


                                        },
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],

        );
        break;
      case ZHorario.isNormal:
        _zHora = new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Text("Hora:"),
                  ),
                ],
              ),
            ),
            new Container(
              width: 100,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                    const Radius.circular(5.0)),
              ),
              child: new Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: new TextField(
                    inputFormatters: [
                      MaskedTextInputFormatterShifter(
                          maskONE: "XX:XX", maskTWO: "XX:XX"),
                      BlacklistingTextInputFormatter(RegExp("[/\\\\,.-]")),

                    ],
                    //focusNode: _horaInicioFocus,
                    keyboardType: TextInputType.number,
                    //controller: _binding.controllerHorarioInicio,
                    decoration: InputDecoration.collapsed(hintText: ""),
                    onChanged: (text) {
                      var hora = text.substring(0, 3);
                      int intHora = int.parse(hora);
                      var minuto = text.substring(3, 5);
                      int intMinuto = int.parse(minuto);
                      if(text.length == 5)
                      {
                        if(intHora > 23 && intMinuto > 59)
                        {
                          showAlertDialogNew("Horario Inválido!", "Por favor insira um valor de hora entre 00 e 23 e um minuto de 00 a 59.");
                        }
                        else if(intHora > 23 && intMinuto < 59)
                        {
                          showAlertDialogNew("Hora Inválida!", "Por favor insira um valor de hora entre 00 e 23.");
                        }
                        else if(intHora < 24 && intMinuto > 59)
                        {
                          showAlertDialogNew("Minuto Inválido!", "Por favor insira um valor de minuto entre 00 e 59.");
                        }
                      }


                    },
                  )),
            ),
          ],

        );
        break;
    }
  }
  void showAlertDialogNew(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) =>  ZAlertDialog(
          zDialog: ZDialog.erro,
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.all(8),
                    child: new Text(title,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.only(left: 16, right: 16,bottom: 16),
                    child: new Text(message,textAlign: TextAlign.center,style: new TextStyle(
                        color:const  Color(0xff707070),fontSize: 13),),
                  )
                ],
              ),
              new Divider(
                color: const Color(0xffdbdbdb),
              ),
              new Container(
                child:  new InkWell(borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                  splashColor: const Color(0xffe6e6e6),
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(12),
                    child: new Text("ENTENDI",style: new TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 8),
              )
            ],
          ),
        ));
  }
  void horarioTrabalhado(){
    var _horarioTrabalhado;
    if(_intHoraEntrada > _intHoraSaida)
    {

      _horarioTrabalhado = 24 - _intHoraEntrada;
      _horarioTrabalhado = _horarioTrabalhado + _intHoraSaida;
      print(_horarioTrabalhado);
      if(_intHoraIntervalo > _horarioTrabalhado)
        {
          showAlertDialogNew("Erro de Jornada!", "O intervalo não pode ser maior que a jornada trabalhada.");
        }
    }
    else{

      _horarioTrabalhado = _intHoraSaida - _intHoraEntrada;
      print(_horarioTrabalhado);
      if(_intHoraIntervalo > _horarioTrabalhado)
      {
        showAlertDialogNew("Erro de Jornada!", "O intervalo não pode ser maior que a jornada trabalhada.");
      }
    }
  }
  void init(){
    _focusEntrada = FocusNode();
    _focusSaida = FocusNode();
    _focusIntervalo = FocusNode();

  }
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  @override
  Widget build(BuildContext context) {
    return _zHora;
  }
}
