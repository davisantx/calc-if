class NoteController {
  double nota1 = 0;
  double nota2 = 0;
  double peso1 = 1;
  double peso2 = 1;
  
  double calcularMediaN1() {
    return (nota1 + nota2) / 2;
  }
  double calcularMediaN2() {
    return (nota1 + nota2) / 2;
  }
  
  double calcularMediaFinal() {
    return ((nota1 * 2)  + (nota2 * 3)) / 5;
  }
  
  double calcularMediaAF() {
    return (nota1 + nota2) / 2;
  }

  double calcularMediaComPesos() {
    return ((nota1 * peso1) + (nota2 * peso2)) / (peso1 + peso2);
  }
}