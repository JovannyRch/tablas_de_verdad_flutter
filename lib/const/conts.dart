import 'package:flutter/material.dart';

const kMainColor = Color(0xFFFF942B);
const kSecondaryColor = Color(0XFFfbe6d1);
const kDisableColor = Color(0xFFFDF6E4);
const kLabelColor = Colors.black54;
const kLabelColorDark = Colors.grey;

const CLEAR_INPUT = "CLEAR_INPUT";
const REMOVE_LETTER = "REMOVE_LETTER";

const CHANGE_CASE = "CHANGE_CASE";

Map<String, String> T = {
  ES: "V",
  EN: "T"
};
Map<String, String> F = {
  ES: "F",
  EN: "F"
};

const ES = "es";
const EN = "en";

String LANGUAGE = ES;

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



Map<String, String> SETTINGS = {
 ES: "Configuración",
 EN: "Setting"
};


Map<String, String> CLOSE_PARENTHESIS = {
  ES:  "Error de sintaxis, falta falta cerrar el paréntesis abierto",
  EN: "Sintaxis error, close the parenthesis"
};


Map<String, String> REQUIRED_2_OPERATORS = {
  ES:  "requiere 2 operandos",
  EN: "requires 2 operators"
};


Map<String, String> REQUIRED_1_OPERATORS = {
  ES:  "requiere 1 operandos",
  EN: "requires 1 operator"
};

Map<String, String> SINTAXIS_ERROR = {
  ES:  "Error de sintaxis",
  EN: "Sintaxis error"
};



Map<String, String> UNCOMPLETED_PARENTHESIS = {
  ES:  "Error de paréntesisu",
  EN: "Parenthesis errror"
};


Map<String, String> RATE_LABEL = {
  ES:  "Califica la app",
  EN: "Rate this app"
};



Map<String, String> PRO_LABEL = {
  ES:  "Pro",
  EN: "Pro"
};



Map<String, String> ADVANCE_MODE_LABEL = {
  ES:  "Modo avanzado",
  EN: "Advance mode"
};


Map<String, String> DARK_MODE_LABEL = {
  ES:  "Modo oscuro",
  EN: "Dark mode"
};




Map<String, String> SHOW_01s_LABEL = {
  ES:  "Mostrar '01's en vez de 'VF's",
  EN: "Show '01's instead of 'TF's"
};


Map<String, String> DONATE_LABEL = {
  ES:  "Donar",
  EN: "Donate"
};


Map<String, String> NO_ADS_LABEL = {
  ES:  "¿Quitar anuncios? Obtiene un cupón",
  EN: "Remove ads? Get a cupon"
};

Map<String, String> NO_ADS_SUBJECT = {
  ES:  "TablasDeVerdad Cupón",
  EN: "TruthTables coupon!"
};



Map<String, String> CHECKOUT_LABEL = {
  ES: "Detalles del pago",
  EN:  "Checkout"
};




Map<String, String> PAYMENT_LABEL = {
  ES:  "Método de pago",
  EN: "Payment method"
};

Map<String, String> CREDIT_CARD = {
  ES:  "Tarjeda de crédito",
  EN: "Credit Card"
};



//Change when app version changed
const IS_PRO_VERSION = false;
const IS_TESTING = false;


const Map<String, String> esSettings = {
  "id": "com.jovannyrch.tablasdeverdad",
  "title": "Tablas de Verdad",
  "lang": ES,
  "ADMOB_ID": "ca-app-pub-3940256099942544~3347511713",
  "VIDEO_ID": "ca-app-pub-4665787383933447/1003394249"
};

const Map<String, String> enSettings = {
  "id": "com.jovannyrch.tablasdeverdad.en",
  "title": "Truth Tables",
  "lang": EN,
  "ADMOB_ID": "ca-app-pub-4665787383933447~1652617896",
  "VIDEO_ID": "ca-app-pub-4665787383933447/2599030026"
};

Map<String, String> settings = esSettings;

String APP_ID = settings["id"];
String TITLE_APP = settings["title"];
String DEFAULT_LANG = settings["lang"];
String ADMOB_ID = settings["ADMOB_ID"];
String VIDEO_ID = settings["VIDEO_ID"];

