import 'package:flutter/foundation.dart';
import 'package:maso/utente.dart';

class StatoModel extends ChangeNotifier {

  List<Utente> _utenti = [];
  int _currentShownUtente = -1;

  void add(Utente u) {
    _utenti.add(u);
    notifyListeners();
  }

  void remove(Utente u) {
    _utenti.remove(u);
    notifyListeners();
  }

  Utente getUtente(i) {
    if (i<0 || i>_utenti.length)
      return null;
    return _utenti[i];
  }

  Utente getCurrentUtente() {
    return getUtente(_currentShownUtente);
  }

}