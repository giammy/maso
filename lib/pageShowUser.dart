import 'package:flutter/material.dart';
import 'package:maso/utente.dart';
import 'package:maso/pageForm.dart';
import 'package:provider/provider.dart';
import 'package:maso/modelStato.dart';

class PageShowUser extends StatelessWidget {
  Utente utente;
  PageShowUser({Key key, @required this.utente}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<StatoModel>(
        builder: (context, stato, child) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Utente'),
      ),
      body: SingleChildScrollView(
        child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            columnWidths: {0: FractionColumnWidth(0.2)},
            children: [

              TableRow(children:[
                const Text("Nome"),
                Text(utente.nome),
              ]
              ),

              TableRow(children:[
                const Text("Cognome"),
                Text(utente.cognome),
              ]
              ),

              TableRow(children:[
                const Text("Indirizzo"),
                Text(utente.indirizzo),
              ]
              ),

              TableRow(children:[
                const Text("Citta'"),
                Text(utente.citta),
              ]
              ),

              TableRow(children:[
                const Text("Provincia"),
                Text(utente.provincia),
              ]
              ),

              TableRow(children:[
                const Text("Stato"),
                Text(utente.stato),
              ]
              ),

              TableRow(children:[
                const Text("Telefono1"),
                Text(utente.telefono1),
              ]
              ),

              TableRow(children:[
                const Text("Telefono2"),
                Text(utente.telefono2),
              ]
              ),

              TableRow(children:[
                const Text("Email"),
                Text(utente.email),
              ]
              ),

              TableRow(children:[
                const Text("Nota"),
                Text(utente.nota),
              ]
              ),

              TableRow(children:[
                const Text("Codice Fiscale"),
                Text(utente.codiceFiscale),
              ]
              ),

              TableRow(children:[
                Text("--"),
                RaisedButton(
                  child: Text("Edit"),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageForm(utente: utente)),
                    );
                  },
                ),
              ],
              )
            ]
        ),
      ),
    );

        }, // builder
    ); // Consumer

  } // build
}
