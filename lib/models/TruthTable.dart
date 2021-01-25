import 'dart:math';

import 'package:tablas_de_verdad/models/operators.dart';

class TruthTable {
  String infix;
  TruthTable(this.infix);
  int counter1s = 0;
  int counters0s = 0;
  List<String> variables = [];
  List<List<String>> table = [];
  List<String> notOpers = [Operators.NOT, Operators.NOT2, Operators.NOT3];
  List<String> andOpers = [Operators.AND, Operators.AND2];
  List<String> orOpers = [Operators.OR, Operators.OR2];
  List<String> xorOpers = [Operators.XOR, Operators.XOR2];

  Map<String, int> priorities = {
    "~": 16,
    "!": 15,
    "¬": 15,
    "⊼": 14,
    "⊻": 13,
    "⊕": 12,
    "↓": 11,
    "&": 10,
    "∧": 10,
    "|": 9,
    "∨": 9,
    "⇍": 8,
    "￩": 7,
    "⇏": 6,
    "⇎": 5,
    "┲": 4,
    "┹": 3,
    "⇒": 2,
    "⇔": 1,
    "(": 0,
  };

  String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String tipo = "";

  void calculate() {
    String postfix = this.infixToPostfix(this.infix);
    table = [];
    counter1s = 0;
    counters0s = 0;
    this.variables.sort();
    int totalCombinations = pow(2, this.variables.length);
    int sizeOfCombinations = (totalCombinations - 1).toRadixString(2).length;

    for (int i = 0; i < totalCombinations; i++) {
      String combination = i.toRadixString(2);
      combination = formatCombination(combination, sizeOfCombinations);
      String combinationInPostfix = varSubstitutions(postfix, combination);
      int result = evaluation(combinationInPostfix);
      table.add([combination, "$result"]);
      print("$combination | $result");
      if(result == 1){
        counter1s++;
      }
      else{
        counters0s++;
      }
    }
    if(counter1s == totalCombinations){
      tipo = "tautologia";
    }
    else if(counters0s == totalCombinations){
      tipo = "contradiccion";
    }
    else {
      tipo = "contingencia";
    }
  }

  String formatCombination(String combination, int lenght) {
    while (combination.length < lenght) {
      combination = "0$combination";
    }
    return combination;
  }

  int evaluation(combination) {
    List<String> stack = [];
    for (String c in combination.split("")) {
      if ("01".contains(c)) {
        stack.add(c);
      } else {
        int resultado;
        int a, b;
        a = int.parse(stack.removeLast());
        if (this.notOpers.contains(c)) {
          resultado = not(a);
        } else {
          b = int.parse(stack.removeLast());
          if (this.orOpers.contains(c)) {
            resultado = or(b, a);
          } else if (this.andOpers.contains(c)) {
            resultado = and(b, a);
          } else if (c == Operators.CODICIONAL) {
            resultado = condicional(b, a);
          } else if (c == Operators.BICODICIONAL) {
            resultado = bicondicional(b, a);
          } else if (c == Operators.NOR) {
            resultado = nor(b, a);
          } else if (c == Operators.NAND) {
            resultado = nand(b, a);
          } else if (this.xorOpers.contains(c)) {
            resultado = xor(b, a);
          } else if (c == Operators.ANTICODICIONAL) {
            resultado = replicador(b, a);
          } else if (c == Operators.NOT_CONDITIONAL) {
            resultado = not(condicional(b, a));
          } else if (c == Operators.NOT_CONDITIONAL_INVERSE) {
            resultado = not(replicador(b, a));
          } else if (c == Operators.NOT_BICONDITIONAL) {
            resultado = not(bicondicional(b, a));
          } else if (c == Operators.TAUTOLOGY) {
            resultado = 1;
          } else if (c == Operators.CONTRADICTION) {
            resultado = 0;
          }
        }
        stack.add("$resultado");
      }
    }

    return int.parse(stack.last);
  }

  int replicador(int a, int b) {
    if (a == 0 && b == 1) return 0;
    return 1;
  }

  int tautologia(int a, int b) {
    return 1;
  }

  int contradiccion(int a, int b) {
    return 0;
  }

  int or(int a, int b) {
    if (a == 1 || b == 1) return 1;
    return 0;
  }

  int and(int a, int b) {
    if (a == 1 && b == 1) return 1;
    return 0;
  }

  int not(int a) {
    if (a == 1) return 0;
    return 1;
  }

  int xor(int a, int b) {
    if (a == b) return 0;
    return 1;
  }

  int nand(int a, int b) {
    return this.not(this.and(a, b));
  }

  int xnor(int a, int b) {
    return this.not(this.xor(a, b));
  }

  int nor(int a, int b) {
    return this.not(this.or(a, b));
  }

  int condicional(int a, int b) {
    if (a == 1 && b == 0) return 0;
    return 1;
  }

  int bicondicional(int a, int b) {
    if (a == b) return 1;
    return 0;
  }


  String varSubstitutions(String postfix, String combination) {
    for (int i = 0; i < variables.length; i++) {
      postfix = postfix.replaceAll(variables[i], combination[i]);
    }
    return postfix;
  }

  String infixToPostfix(String infix) {
    List<String> opStack = [];
    List<String> postfixList = [];

    for (String token in infix.split("")) {
      if (this.alphabet.contains(token) ||
          this.alphabet.toLowerCase().contains(token)) {
        postfixList.add(token);
        if (!this.variables.contains(token)) {
          this.variables.add(token);
        }
      } else if (token == ")") {
        String topToken = opStack.removeLast();

        while (topToken != "(") {
          postfixList.add(topToken);
          topToken = opStack.removeLast();
        }
      } else {
        while (opStack.isNotEmpty &&
            priorities[opStack.last] > priorities[token]) {
          postfixList.add(opStack.removeLast());
        }
        opStack.add(token);
      }
    }

    while (opStack.isNotEmpty) {
      postfixList.add(opStack.removeLast());
    }
    return postfixList.join();
  }
}



void main() {
  TruthTable t = TruthTable("A∨~B");
  t.calculate();
}
