// "Uma classe deve ter apenas um motivo para mudar"
// Sua responsabilidade é sempre em cima de um e apenas um ator.

//Aqui podemos ver que a classe ContaCorrente está realizando ações de banco,
//o que fere o principio da responsabilidade única
class ContaCorrente {
  validarContaExiste() {
    // logica crucial de negocio.
  }

  salvarModificacoes() {
    print('salvando no db....');
  }
}

/*

Solução: Devemos separar cada responsabilidade para sua regra de negocio crucial, 
um objeto não pode e deve fazer mais do que é o dominio dele.

Lembre-se: sua funcionalidade não importa a granularidade (pacote/modulo/classe/metodo/função)
não deve fazer o que não é proposto, normalmente um Funcionario não deve ser capaz de adicionar um produto em seu dominio,
um Produto não deve ser capaz de exercer controle sobre o banco de dados, um pacote que diz que faz A não deve fazer B.

*/

class ContaCorrenteRepository {
  void saveChanges() => print('salvando no db....');
}

class ContaCorrente2 {
  final ContaCorrenteRepository _repository = ContaCorrenteRepository();
  validarContaExiste() {
    // logica crucial de negocio.
  }

  void salvarModificacoes() {
    _repository.saveChanges();
  }
}
