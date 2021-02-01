import 'package:flutter/material.dart';

const kMainColor = Color(0xFFFF942B);
const kSecondaryColor = Color(0XFFfbe6d1);
const kDisableColor = Color(0xFFFDF6E4);
const kLabelColor = Colors.black54;

const CLEAR_INPUT = "CLEAR_INPUT";
const REMOVE_LETTER = "REMOVE_LETTER";

const CHANGE_CASE = "CHANGE_CASE";

const T = "T";
const F = "F";

const ES = "es";
const EN = "en";

String LANGUAGE = EN;

//Message
Map<String, String> TAUTOLOGY = {
  ES: 'Tautología',
  EN: 'Tautology',
};
Map<String, String> CONTRADICTION = {
  ES: 'Contradicción',
  EN: 'Contradiction',
};

Map<String, String> CONTINGENCY = {
  ES: 'Contingencia',
  EN: 'Contingency',
};
Map<String, String> EMPTY_INPUT_MESSAGE = {
  ES: "Entrada vacía",
  EN: "Empty input"
};

Map<String, String> RESULT_LABEL = {
  ES: "Resultado",
  EN: "Result"
};
Map<String, String> EXPRESSION_LABEL = {
  ES: "Expresión lógica",
  EN: "Logic expression",
};
Map<String, String> EVALUATION_LABEL = {
  ES: "Evaluación",
  EN: "Evaluation"
};
Map<String, String> FINAL_TABLE_LABEL = {
  ES: "Tabla final",
  EN: "Final table"
};
Map<String, String> STEP_BY_STEP_LABEL = {
  ES: "Paso a paso",
  EN: "Step by step"
};
Map<String, String> STEP_LABEL = {
  ES: "Paso",
  EN: "Step"
};

String TITLE_APP ="Tablas de verdad";

Map<String, String> SETTINGS = {
 ES: "Configuración",
 EN: "Setting"
};

const IS_TESTING = true;
