class Notas {
  double notaN11 = 0;
  double notaN12 = 0;
  double notaN21 = 0;
  double notaN22 = 0;
  double mediaFinal = 0;
  double notaAF = 0;
  
  double calcularMediaN1() {
    return (notaN11 + notaN12) / 2;
  }
  double calcularMediaN2() {
    return (notaN21 + notaN22) / 2;
  }
  
  double calcularMediaFinal() {
    return ((calcularMediaN1() * 2)  + (calcularMediaN2() * 3)) / 5;
  }
  
  double calcularMediaAF() {
    return (mediaFinal + notaAF) / 2;
  }
}