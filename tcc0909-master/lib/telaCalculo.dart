import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:tela_de_calculo/Home.dart';
import 'package:tela_de_calculo/historico.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'buttonDropCalculo.dart';
import 'graficoo.dart';

class TelaCalculo extends StatefulWidget {
  const TelaCalculo({Key? key}) : super(key: key);

  @override
  State<TelaCalculo> createState() => _TelaCalculoState();
}

// Controles //
class _TelaCalculoState extends State<TelaCalculo> {
  final TextEditingController _controllerDias =
      TextEditingController(); //dados que não precisam de estar na conta
  final TextEditingController _controllerKM = TextEditingController();
  final TextEditingController _controllerLitros =
      TextEditingController(); //dados que não precisam de estar na conta
  final TextEditingController _controllerValor =
      TextEditingController(); //dados que não precisam de estar na conta

  void chamarDialogo() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('ATENÇÃO'),
        content: const Text('Deseja calcular?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Não'),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                resultado = calculoDoConsumo(
                  double.parse(_controllerKM.text),
                  double.parse(_controllerLitros.text),
                );
                resultadoTwo = calculoDoValorDaGalosina(
                  double.parse(_controllerValor.text),
                  double.parse(_controllerLitros.text),
                );
              });
            },
            child: const Text('Calcular'),
          ),
        ],
      ),
    );
  }

  String resultadoCalculo = "";
  String? resultadoTwo;
  String? resultado;

  String? calculoDoValorDaGalosina(
      double controllerValor, double controllerLitros) {
    var testeTre = (controllerValor / controllerLitros);

    return testeTre.toString();
  }

  String? calculoDoConsumo(double controllerKM, double controllerLitros) {
    var testeTwo = (controllerKM / controllerLitros);

    return testeTwo.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('CALCULO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('ATENÇÃO'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(3),
                      color: Colors.blue[900],
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: _controllerDias,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.calendar_month),
                            hintText: 'Informe o dia'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.blue[900],
                    child: MyStatefulWidget(),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    controller: _controllerLitros,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.ev_station),
                        hintText: 'Informe os litros'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    controller: _controllerKM,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.speed_outlined),
                        hintText: 'Informe os KMS'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    controller: _controllerValor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.money),
                        hintText: 'Informe o valor da gasolina'),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.blue[900],
                padding: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.money_off_rounded),
                      hintText: resultadoTwo),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.blue[900],
                padding: EdgeInsets.all(3),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.verified_rounded),
                      hintText: resultado),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    chamarDialogo();

                    log(_controllerDias.text);
                    log(_controllerKM.text);
                    log(_controllerValor.text);
                    log(_controllerLitros.text);
                  },
                  icon: Icon(Icons.calculate),
                  label: Text('Calcular'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyTable()));
                  },
                  icon: Icon(Icons.history_sharp),
                  label: Text('Histórico'),
                ),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
