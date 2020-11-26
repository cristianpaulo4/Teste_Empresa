abstract class ILoginRepository {
  // buscar usuario
  Future<bool> bucarUsuario(String email, String senha);
}
