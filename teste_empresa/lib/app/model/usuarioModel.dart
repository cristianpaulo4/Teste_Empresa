class UsuarioModel {
  String _sId;
  String _nome;
  String _dataNascimento;
  String _email;
  String _senha;

  UsuarioModel(
      {String sId,
      String nome,
      String dataNascimento,
      String email,
      String senha}) {
    this._sId = sId;
    this._nome = nome;
    this._dataNascimento = dataNascimento;
    this._email = email;
    this._senha = senha;
  }

  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  String get dataNascimento => _dataNascimento;
  set dataNascimento(String dataNascimento) => _dataNascimento = dataNascimento;
  String get email => _email;
  set email(String email) => _email = email;
  String get senha => _senha;
  set senha(String senha) => _senha = senha;

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _nome = json['nome'];
    _dataNascimento = json['dataNascimento'];
    _email = json['email'];
    _senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['nome'] = this._nome;
    data['dataNascimento'] = this._dataNascimento;
    data['email'] = this._email;
    data['senha'] = this._senha;
    return data;
  }
}
