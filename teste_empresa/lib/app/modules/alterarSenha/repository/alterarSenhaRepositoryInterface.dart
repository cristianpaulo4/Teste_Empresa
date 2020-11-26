abstract class IAlterarSenhaRepository {
  // alterar senha
  Future<bool> alterarSenha(String email, String senha, String nova);
}
