import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maso/pageForm.dart';
import 'package:maso/pageShowUser.dart';
import 'package:maso/utente.dart';

class ListaUtenti extends StatefulWidget {
  //ListaUtenti({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _ListaUtentiState createState() => new _ListaUtentiState();
}

class _ListaUtentiState extends State<ListaUtenti> {
  Firestore firestore = Firestore.instance;

  final Utente utente = new Utente(
    null,null,null,null,null,
    null,null,null,null,null,
    null,null,null,null,null,
    null,null,null,null,
  );

  List<DocumentSnapshot> products = []; // stores fetched products
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 10; // documents to be fetched per request
  DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched
  ScrollController _scrollController = ScrollController(); // listener for listview scrolling

  //_ListaUtentiState(): super();

  _getProducts() async {
    print("_getProducts");
    if (!hasMore) {
      print('No More Products');
      return;
    }
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      print("_getProducts: query 0");
      querySnapshot = await firestore
          .collection('utenti')
          .orderBy('cognome')
          .limit(documentLimit)
          .getDocuments();
    } else {
      print("_getProducts: query 1");
      querySnapshot = await firestore
          .collection('utenti')
          .orderBy('cognome')
          .startAfterDocument(lastDocument)
          .limit(documentLimit)
          .getDocuments();
      //print(1);
    }
    if (querySnapshot.documents.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    products.addAll(querySnapshot.documents);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        _getProducts();
      }
    });

    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child:
            products.length == 0
              ? Center(
                  child: Text('In attesa ...'),
                )
              : ListView.builder(
                controller: _scrollController,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //contentPadding: EdgeInsets.all(5),
                    title: Text(products[index].data['cognome']),
                    subtitle: Text(products[index].data['nome']),
                    onTap: () {
                      print("Tap");

                      var v = products[index].data;
                      Utente ut = Utente(
                        v['nome'],v['cognome'],v['soprannome'],
                        v['indirizzo'],v['citta'],v['provincia'],v['stato'],
                        v['telefono1'],v['telefono2'],v['email'],
                        v['codiceUtente'],
                        v['nota'],v['nota1'],v['nota2'],v['nota3'],
                        v['dataNascita'], v['codiceFiscale'],
                        v['dataInserimento'], v['autoreInserimento'],
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageShowUser(utente: ut)),
                      );
                      }, // onTap
                  );
                },
              ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageForm(utente: utente)),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  } // build

}
