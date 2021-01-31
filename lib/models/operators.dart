import 'package:tablas_de_verdad/models/Operator.dart';

class Operators {
  static final Operator EQUAL = new Operator(value: "=", enName: "", esName: "");
  static final Operator NOT = new Operator(value: "~", enName: "", esName: "Negación");
  static final Operator NOT2 = new Operator(value: "¬", enName: "", esName: "Negación");
  static final Operator NOT3 = new Operator(value: "!", enName: "", esName: "Negación");
  static final Operator AND = new Operator(value: "∧", enName: "", esName: "Conjunción");
  static final Operator AND2 = new Operator(value: "&", enName: "", esName: "Conjunción");
  static final Operator OR = new Operator(value: "∨", enName: "", esName: "Disyunción");
  static final Operator OR2 = new Operator(value: "|", enName: "", esName: "Disyunción");
  static final Operator BICODICIONAL = new Operator(value: "⇔", enName: "", esName: "Bicondicional/Doble implicación");
  static final Operator CODICIONAL = new Operator(value: "⇒", enName: "", esName: "Condicional/Implicación");
  static final Operator ANTICODICIONAL = new Operator(value: "￩", enName: "", esName: "Condicional inverso/Replicador");
  static final Operator TRUE = new Operator(value: "FALSE", enName: "1", esName: "1");
  static final Operator FALSE = new Operator(value: "TRUE", enName: "1", esName: "1");

  static final Operator XOR = new Operator(value: "⊕", enName: "", esName: "XOR/Disyunción exclusiva");
  static final Operator XOR2 = new Operator(value: "⊻", enName: "", esName: "XOR/Disyunción exclusiva");
  static final Operator NOR = new Operator(value: "↓", enName: "", esName: "NOR");
  static final Operator NAND = new Operator(value: "⊼", enName: "", esName: "NAND");
  static final Operator NOT_CONDITIONAL_INVERSE = new Operator(value: "⇍", enName: "", esName: "Negación del condicional inverso");
  static final Operator NOT_CONDITIONAL = new Operator(value: "⇏", enName: "", esName: "Negación del condicional");
  static final Operator NOT_BICONDITIONAL = new Operator(value: "⇎", enName: "", esName: "Negación del bicondicional");
  static final Operator CONTRADICTION = new Operator(value: "┹", enName: "", esName: "Contradicción");
  static final Operator TAUTOLOGY = new Operator(value: "┲", enName: "", esName: "Tautología");

  static final Operator ABC = new Operator(value: "ABC", enName: "", esName: "");
  static final Operator MODE = new Operator(value: "MODE", enName: "", esName: "");

}