import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:z_components/components/utils/dialog-utils.dart';
import 'package:z_components/styles/main-style.dart';

class ZInputCNPJ extends StatefulWidget {

  final Key key;
  FocusNode cnpjFocus;
  var controllerCNPJ = new TextEditingController();
  FocusNode proximoFocus;
  ValueChanged<String> onChange;

  ZInputCNPJ(
      {this.key,
       @required this.cnpjFocus,
       @required this.controllerCNPJ,
        this.onChange,
        this.proximoFocus,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZInputCNPJState();
}

class _ZInputCNPJState extends State<ZInputCNPJ> {

  int countcnpj = 1;
  DialogUtils _dialogUtils;
  String cnpj;
  bool valideCnpj;

  @override
  void initState() {
    _dialogUtils = new DialogUtils(context);
    initNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainStyle.styleTextInput(
        context,
        "CNPJ:",
        TextInputType.number,
            () {
          FocusScope.of(context).requestFocus(widget.cnpjFocus);
        },
        widget.cnpjFocus,
        widget.controllerCNPJ,
        widget.proximoFocus,
            (text) {
              if (widget.onChange != null) widget.onChange(text);

              cnpj = text;
              countcnpj = 0;
          if (cnpj.length == 18) {
            _fieldFocusChange(context, widget.cnpjFocus,
                widget.proximoFocus);
          }
        },true,
        textMask: "XX.XXX.XXX/XXXX-XX",
        hintText: "XX.XXX.XXX/XXXX-XX");
  }

  void initNome() {
    widget.cnpjFocus.addListener(() {
      if (!widget.cnpjFocus.hasFocus &&
          countcnpj == 0 &&
          cnpj != "") {
        _validarCNPJ();
      }
    });
  }
  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    if (nextFocus != null) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  void _validarCNPJ() {
    if (!CNPJValidator.isValid(cnpj)) {
      valideCnpj = false;
      _dialogUtils.showAlertDialogNewAviso(
          "CNPJ Inválido!", "Por Favor insira um CNPJ válido.");
    } else {
      valideCnpj = true;
    }
  }

}
