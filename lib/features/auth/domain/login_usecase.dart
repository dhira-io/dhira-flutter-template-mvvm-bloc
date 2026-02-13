import 'package:dartz/dartz.dart';
import 'package:dhira_flutter_template/core/error/failures.dart';
import 'package:dhira_flutter_template/features/auth/domain/auth_repository.dart';
import 'package:dhira_flutter_template/features/auth/domain/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
