class Minterm {
  List<String> values;
  String value;
  bool used;

  Minterm({this.values, this.value}) {
    this.used = false;
    this.values.sort();
  }

  @override
  String toString() {
    String values = this.values.join(", ");
    return "m$values = $value";
  }

  bool valuesEquals(Minterm m) {
    bool firstTest = this.values.length == m.values.length;

    if (!firstTest) {
      return false;
    }

    for (int i = 0; i < this.values.length; i++) {
      if (this.values[i] != m.values[i]) {
        return false;
      }
    }
    return true;
  }

  bool equals(Minterm m) {
    bool firstTest =
        this.value == m.value;

    if(!firstTest){
      return false;
    }

    return this.valuesEquals(m);
  }

  List<String> getValues() {
    return this.values;
  }

  bool isUsed() {
    return this.used;
  }

  void use() {
    this.used = true;
  }

  Minterm combine(Minterm m) {
    if (this.value == m.value) {
      return null;
    }
    
    bool valuesTest = this.valuesEquals(m);
    if(valuesTest){
      return null;
    }

    int diff = 0;
    String result = "";

    for(int i = 0; i < this.value.length; i++){
      if(this.value[i] != m.value[i]){
        diff += 1;
        result += "-";
      }
      else{
        result += this.value[i];
      }

      if( diff > 1){
        return null;
      }
    }
    return new Minterm(value: result, values: [...this.values, ...m.values]);
  }
}
