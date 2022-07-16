// DIP - Depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print('salvando pamento.');
}

class ContaCorrente {
  final PagamentoRepository? _repository;
  ContaCorrente() : _repository = PagamentoRepository();

  void execultarAlgumaLogica() {
    _repository?.save();
  }
}

/* main(List<String> args) {
  ContaCorrente c = ContaCorrente();
  c.execultarAlgumaLogica();
} */

/*
  A violação acontece na linha 9, estamos dependendo de uma classe concreta
  se quisermos fazer o mock por exemplo do repositoy não é possível.

  Solução:
  Vamos inverter a responsabilidade, deixar que quem chamar a ContaCorrente resolva a dependencia do repository.
 */

abstract class IPagamentoRepository {
  void save();
}

class PagamentoRepositoryImp implements IPagamentoRepository {
  @override
  void save() => print('implementação');
}

//Agora podemos criar uma implementação para testes.
class PagamentoRepositoryMock implements IPagamentoRepository {
  @override
  void save() => print('mock');
}

class ContaCorrente2 {
  final IPagamentoRepository _repository;
  ContaCorrente2({required IPagamentoRepository repository})
      : _repository = repository;

  void execultarAlgumaLogica() {
    _repository.save();
  }
}

main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2(repository: PagamentoRepositoryImp());
  c.execultarAlgumaLogica();
  c = ContaCorrente2(repository: PagamentoRepositoryMock());
  c.execultarAlgumaLogica();
}
