import 'package:math_expressions/math_expressions.dart';

void main() {
  result();
}

//função para calcular o resultado
void result() {
  Parser conversor = Parser();
  Expression exp = conversor.parse('1+2+34+5');
  double result = exp.evaluate(EvaluationType.REAL, ContextModel());
  print(result);
}
