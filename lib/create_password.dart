class CreatePassController {
  String firstPass = '';

  void newOnChanged({String? firstPass}) {
    // print(textEditingController.text);
    this.firstPass = firstPass ?? this.firstPass;
    print('Senha criada: ${this.firstPass}');
  }

  bool passCreated() {
    if (firstPass == '') {
      return false;
    } else {
      return true;
    }
  }

  String getPassword() {
    return firstPass;
  }
}
