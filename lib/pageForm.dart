import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maso/utente.dart';

class PageForm extends StatelessWidget {
  final db = Firestore.instance;
  final Utente utente;
  PageForm({Key key, @required this.utente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nomeController = new TextEditingController();
    TextEditingController _cognomeController = new TextEditingController();
    TextEditingController _indirizzoController = new TextEditingController();
    TextEditingController _cittaController = new TextEditingController();
    TextEditingController _provinciaController = new TextEditingController();
    TextEditingController _statoController = new TextEditingController();
    TextEditingController _telefono1Controller = new TextEditingController();
    TextEditingController _telefono2Controller = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _codiceUtenteController = new TextEditingController();
    TextEditingController _notaController = new TextEditingController();
    TextEditingController _nota1Controller = new TextEditingController();
    TextEditingController _nota2Controller = new TextEditingController();
    TextEditingController _nota3Controller = new TextEditingController();
    //TextEditingController _dataNascitaController = new TextEditingController();
    TextEditingController _codiceFiscaleController = new TextEditingController();

    _nomeController.text = utente.nome;
    _cognomeController.text = utente.cognome;
    _indirizzoController.text = utente.indirizzo;
    _cittaController.text = utente.citta;
    _provinciaController.text = utente.provincia;
    _statoController.text = utente.stato;
    _telefono1Controller.text = utente.telefono1;
    _telefono2Controller.text = utente.telefono2;
    _emailController.text = utente.email;
    _codiceUtenteController.text = utente.codiceUtente;
    _notaController.text = utente.nota;
    _nota1Controller.text = utente.nota1;
    _nota2Controller.text = utente.nota2;
    _nota3Controller.text = utente.nota3;
    //_dataNascitaController.text = utente.dataNascita;
    _codiceFiscaleController.text = utente.codiceFiscale;

    return Scaffold(
        appBar: AppBar(
          title: Text('Inserisci utente'),
        ),
        body: SingleChildScrollView(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            columnWidths: {0: FractionColumnWidth(0.2)},
            children: [

              TableRow(children:[
                  const Text("Nome"),
                  TextField(
                    controller: _nomeController,
                    //autofocus: true,
                  ),
                ]
              ),

              TableRow(children:[
                  const Text("Cognome"),
                  TextField(
                    controller: _cognomeController,
                  ),
                ]
              ),

              TableRow(children:[
                const Text("Indirizzo"),
                TextField(
                  controller: _indirizzoController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Citta'"),
                TextField(
                  controller: _cittaController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Provincia"),
                TextField(
                  controller: _provinciaController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Stato"),
                TextField(
                  controller: _statoController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Telefono1"),
                TextField(
                  controller: _telefono1Controller,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Telefono2"),
                TextField(
                  controller: _telefono2Controller,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Email"),
                TextField(
                  controller: _emailController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Nota"),
                TextField(
                  controller: _notaController,
                ),
              ]
              ),

              TableRow(children:[
                const Text("Codice Fiscale"),
                TextField(
                  controller: _codiceFiscaleController,
                ),
              ]
              ),

              TableRow(children:[
                Text("--"),
                RaisedButton(
                  child: Text("Conferma"),
                  onPressed: () {
                    utente.nome = _nomeController.text;
                    utente.cognome = _cognomeController.text;
                    utente.indirizzo = _indirizzoController.text;
                    utente.citta = _cittaController.text;
                    utente.provincia = _provinciaController.text;
                    utente.stato = _statoController.text;
                    utente.telefono1 = _telefono1Controller.text;
                    utente.telefono2 = _telefono2Controller.text;
                    utente.email = _emailController.text;
                    utente.nota = _notaController.text;
                    utente.nota1 = _nota1Controller.text;
                    utente.nota2 = _nota2Controller.text;
                    utente.nota3 = _nota3Controller.text;
                    //utente.dataNascita = _dataNascitaController.text;
                    utente.codiceFiscale = _codiceFiscaleController.text;

                    db.collection("utenti").add(utente.toJson());
                    //Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pop(context);
                  },
                ),
              ],
              )
            ]
          ),
        ),
    );
  }
}
