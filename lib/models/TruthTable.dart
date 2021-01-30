import 'dart:math';

import 'package:tablas_de_verdad/models/operators.dart';
import 'package:tablas_de_verdad/models/RowTable.dart';

class TruthTable {
  String infix;
  String postfix;
  TruthTable(this.infix);
  int counter1s = 0;
  int counters0s = 0;
  List<String> variables = [];
  List<RowTable> table = [];
  List<String> notOpers = [Operators.NOT.value, Operators.NOT2.value, Operators.NOT3.value];
  List<String> andOpers = [Operators.AND.value, Operators.AND2.value];
  List<String> orOpers = [Operators.OR.value, Operators.OR2.value];
  List<String> xorOpers = [Operators.XOR.value, Operators.XOR2.value];
  String errorMessage = "";

  int index0InVariables = -1;
  int index1InVariables = -1;

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

  String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01";
  String tipo = "";

  bool convertInfixToPostix() {
    this.postfix = this.infixToPostfix(this.infix);
    if(this.postfix == null){
      return false;
    }
    return true;
  }

  void calculate() {
    table = [];
    counter1s = 0;
    counters0s = 0;
    variables.sort();

    if(variables.contains("0")){
      index0InVariables = variables.indexOf("0");
    }

    if(variables.contains("1")){
      index1InVariables = variables.indexOf("1");
    }

    int totalCombinations = pow(2, variables.length);
    int sizeOfCombinations = (totalCombinations - 1).toRadixString(2).length;

    for (int i = totalCombinations -1; i >= 0; i--) {
      String combination = i.toRadixString(2);
      combination = formatCombination(combination, sizeOfCombinations);
      String combinationInPostfix = varSubstitutions(postfix, combination);
      int result = evaluation(combinationInPostfix);
      table.add(new RowTable(index: i,combination: combination, result: "$result"));

      if (result == 1) {
        counter1s++;
      } else {
        counters0s++;
      }
    }
    if (counter1s == totalCombinations) {
      tipo = "Tautología";
    } else if (counters0s == totalCombinations) {
      tipo = "Contradicción";
    } else {
      tipo = "Contingencia";
    }
  }

  String formatCombination(String combination, int lenght) {
    while (combination.length < lenght) {
      combination = "0$combination";
    }
  

  if(index0InVariables != -1){
      combination = combination.replaceRange(index0InVariables, index0InVariables+1, "0");
    }

    if(index1InVariables != -1){
      combination = combination.replaceRange(index1InVariables, index1InVariables+1, "1");
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
          } else if (c == Operators.CODICIONAL.value) {
            resultado = condicional(b, a);
          } else if (c == Operators.BICODICIONAL.value) {
            resultado = bicondicional(b, a);
          } else if (c == Operators.NOR.value) {
            resultado = nor(b, a);
          } else if (c == Operators.NAND.value) {
            resultado = nand(b, a);
          } else if (this.xorOpers.contains(c)) {
            resultado = xor(b, a);
          } else if (c == Operators.ANTICODICIONAL.value) {
            resultado = replicador(b, a);
          } else if (c == Operators.NOT_CONDITIONAL.value) {
            resultado = not(condicional(b, a));
          } else if (c == Operators.NOT_CONDITIONAL_INVERSE.value) {
            resultado = not(replicador(b, a));
          } else if (c == Operators.NOT_BICONDITIONAL.value) {
            resultado = not(bicondicional(b, a));
          } else if (c == Operators.TAUTOLOGY.value) {
            resultado = 1;
          } else if (c == Operators.CONTRADICTION.value) {
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
      if (this.alphabet.contains(token)) {
        postfixList.add(token);
        if (!this.variables.contains(token)) {
          this.variables.add(token);
        }
      } else if (token == ")") {
        if (opStack.isEmpty) {
          errorMessage = "Paréntesis incompletos";
          return null;
        }
        String topToken = opStack.removeLast();

        while (topToken != "(") {
          postfixList.add(topToken);

          if (opStack.isEmpty) {
            errorMessage = "Error de paréntesis";
            return null;
          }

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
      String last = opStack.removeLast();
      if(last == "("){
        errorMessage = "Error de sintaxis, falta falta cerrar el paréntesis abierto";
        return null;
      }
      postfixList.add(last);
    }
    return postfixList.join();
  }

  bool checkIfIsCorrectlyFormed() {
    List<String> pila = [];

    for (String c in this.postfix.split("")) {
      if (isOperator(c)) {
        if (pila.isEmpty) {
          if (required2Operators(c)) {
            this.errorMessage = "Error, el operador $c requiere 2 operandos";
          } else {
            this.errorMessage = "Error, el operador $c requiere 1 operando";
          }
          return false;
        }
        pila.removeLast();
        String resultado;
        if (required2Operators(c)) {
          if (pila.isEmpty) {
            this.errorMessage = "Error, el operador $c necesita 2 operandos";
            return false;
          }
          pila.removeLast();
          resultado = "0";
        } else if (notOpers.contains(c)) {
          resultado = "9";
        }
        pila.add(resultado);
      } else {
        pila.add(c);
      }
    }
    if (pila.length == 1) {
      return true;
    } else {
      this.errorMessage = "Error de sintaxis, la proposición lógica no está bien formada";
      return false;
    }
  }

  bool required2Operators(String operator) {
    if (this.notOpers.contains(operator)) return false;
    return true;
  }

  bool isOperator(String val) {
    if ("$alphabet()[]{}".contains(val)) return false;
    return true;
  }
}
