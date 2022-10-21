import 'package:flutter/material.dart';
import 'package:tela_de_calculo/Home.dart';
import 'main.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

void main() {
  runApp(MyTable());
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Histórico"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('ATENÇÃO'),
                content: const Text('Deseja apagar tabela?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Sim'),
                    child: const Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Não'),
                    child: const Text('Não'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: criaTabela(context),
      ),
    );
  }

  criaTabela(context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        DataTable(
          dataTextStyle: TextStyle(
            color: Colors.blue,
          ),
          border: TableBorder(
              horizontalInside: BorderSide(
                  width: 1, color: Colors.blue, style: BorderStyle.solid)),
          headingTextStyle: TextStyle(
            color: Colors.blue,
          ),
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Data',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Litros',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'KMS',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Preço',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Preço por litro',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Consumo Total',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Sarah')),
                DataCell(Text('19')),
                DataCell(Text('Student')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Janine')),
                DataCell(Text('43')),
                DataCell(Text('Professor')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
                DataCell(Text('Sarah')),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
