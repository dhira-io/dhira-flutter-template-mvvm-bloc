import 'package:dartz/dartz.dart';
import 'package:dhira_flutter_template/core/error/failures.dart';
import 'package:dhira_flutter_template/features/auth/domain/auth_repository.dart';
import 'package:dhira_flutter_template/features/auth/domain/user_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repository.register(name: name, email: email, password: password);
  }
}
