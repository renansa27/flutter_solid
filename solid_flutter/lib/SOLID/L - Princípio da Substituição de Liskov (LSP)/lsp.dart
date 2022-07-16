// LSP - Os subtipos devem ser substituíveis pelos seus tipos base

abstract class Conta {
  void depositar(int val);
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente implements Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void transferir(int valor) => print('realizando...');

  @override
  void realizarEmprestimo() => print('realizando...');
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void transferir(int valor) =>
      throw Exception('Conta poupança não faz transerencia.');

  @override
  void realizarEmprestimo() =>
      throw Exception('Conta poupança não faz emprestimo.');
}

main(List<String> args) {
  Conta c = ContaCorrente();
  c.realizarEmprestimo();
  c = ContaPoupanca();
  // Como a conta poupança não deve fazer emprestimos, uma exception será lançada
  // como podemos ver na linha 28.
  c.realizarEmprestimo();
}

/** 
  O exemplo fere o principio do LSP uma vez que as classes derivadas não podem ser usadas como classe base.
  Entretanto esse problema será solucionado com o (Princípio da Segregação de interface)
*/