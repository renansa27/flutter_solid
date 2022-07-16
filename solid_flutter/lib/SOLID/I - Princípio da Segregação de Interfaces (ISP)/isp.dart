// ISP - Muitas interfaces específicas são melhores que uma geral.

abstract class Conta {
  void depositar(int val);
  void transferir(int val);
  void realizarEmprestimo(int val);
}

class ContaCorrente extends Conta {
  @override
  void depositar(int val) => print('Realizando um deposito');

  @override
  void transferir(int val) => print('Realizando uma transferencia');

  @override
  void realizarEmprestimo(int val) => print('Realizando um emprestimo de $val');
}

class ContaPoupanca extends Conta {
  @override
  void depositar(int val) => print('Realizando um deposito');

  @override
  void transferir(int val) =>
      throw Exception('Conta poupança não faz transferencia');

  @override
  void realizarEmprestimo(int val) =>
      throw Exception('Conta poupança não faz emprestimno');
}

/// O problema aqui é que estamos dependendo da classe Conta (classe de contrato)
/// e conta nos oferece mais coisas do que realmente precisamos para deposito mas que
/// demovos implementar devido a classe pai (Conta) possui esse métodos a serem implementados.
///
/// Solução:
/// Criar classes abstratas diferentes para que não precisemos implementar a tranferencia e nem
/// emprestimos na classe ContaPoupanca haja vista que a conta poupança não realiza essas funções.

abstract class Conta2 {
  void depositar(int val);
}

abstract class CestaServicos {
  void transferir(int val);
  void realizarEmprestimo(int val);
}

class ContaCorrente2 extends Conta2 implements CestaServicos {
  @override
  void depositar(int val) => print('Realizando deposito de $val');

  @override
  void transferir(int val) => print('Realizando transferencia de $val');

  @override
  void realizarEmprestimo(int val) => print('Realizando emprestimo de $val');
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int val) => print('Realizando deposito de $val');
}

void main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2();
  c.transferir(10);
  ContaPoupanca2 cp = ContaPoupanca2();
  cp.depositar(10);
}
