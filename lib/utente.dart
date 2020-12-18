class Utente{
   String nome;
   String cognome;
   String soprannome;
   String indirizzo;
   String citta;
   String provincia;
   String stato;
   String telefono1;
   String telefono2;
   String email;
   String codiceUtente;
   String nota;
   String nota1;
   String nota2;
   String nota3;
   DateTime dataNascita;
   String codiceFiscale;
   DateTime dataInserimento;
   String autoreInserimento;

  Utente(
    this.nome,
    this.cognome,
    this.soprannome,
    this.indirizzo,
    this.citta,
    this.provincia,
    this.stato,
    this.telefono1,
    this.telefono2,
    this.email,
    this.codiceUtente,
    this.nota,
    this.nota1,
    this.nota2,
    this.nota3,
    this.dataNascita,
    this.codiceFiscale,
    this.dataInserimento,
    this.autoreInserimento,
      );

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'cognome': cognome,
    'soprannome': soprannome,
    'indirizzo': indirizzo,
    'citta': citta,
    'provincia': provincia,
    'stato': stato,
    'telefono1': telefono1,
    'telefono2': telefono2,
    'email': email,
    'codiceUtente': codiceUtente,
    'nota': nota,
    'nota1': nota1,
    'nota2': nota2,
    'nota3': nota3,
    'dataNascita': dataNascita,
    'codiceFiscale': codiceFiscale,
    'dataInserimento': dataInserimento,
    'autoreInserimento': autoreInserimento,
  };
}

