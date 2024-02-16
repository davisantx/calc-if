class NoteController {
  double notaN11 = 0;
  double notaN12 = 0;
  double notaN21 = 0;
  double notaN22 = 0;
  double mediaFinal = 0;
  double notaAF = 0;
  double nota1 = 0;
  double nota2 = 0;
  double peso1 = 1;
  double peso2 = 1;
  
  double calcularMediaN1() {
    return (notaN11 + notaN12) / 2;
  }
  double calcularMediaN2() {
    return (notaN21 + notaN22) / 2;
  }
  
  double calcularMediaFinal() {
    return ((notaN11 * 2)  + (notaN12 * 3)) / 5;
  }
  
  double calcularMediaAF() {
    return (mediaFinal + notaAF) / 2;
  }

  double calcularMediaComPesos() {
    return ((nota1 * peso1) + (nota2 * peso2)) / (peso1 + peso2);
  }
}