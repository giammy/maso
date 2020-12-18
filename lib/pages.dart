import 'package:flutter/material.dart';
import 'package:maso/pageForm.dart';
import 'package:maso/listaUtenti.dart';
import 'package:maso/utente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListaUtenti();
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        "Magazzino"
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        "Assegnazioni"
    );
  }
}
