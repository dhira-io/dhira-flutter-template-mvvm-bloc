import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../core/storage/token_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/user_entity.dart';
import 'auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenRepository tokenRepository;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenRepository,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authModel = await remoteDataSource.login(
          email: email,
          password: password,
        );

        // Save token
        if (authModel.token != null) {
          await tokenRepository.saveToken(authModel.token!);
        }

        return Right(authModel.toEntity());
      } on ServerException catch (e) {
        return Left(Failure.server(message: e.message, code: e.code));
      } on UnauthorizedException catch (e) {
        return Left(Failure.unauthorized(message: e.message));
      } catch (e) {
        return Left(Failure.unknown(message: e.toString()));
      }
    } else {
      return const Left(Failure.network());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authModel = await remoteDataSource.register(
          name: name,
          email: email,
          password: password,
        );

        // Save token
        if (authModel.token != null) {
          await tokenRepository.saveToken(authModel.token!);
        }

        return Right(authModel.toEntity());
      } on ServerException catch (e) {
        return Left(Failure.server(message: e.message, code: e.code));
      } catch (e) {
        return Left(Failure.unknown(message: e.toString()));
      }
    } else {
      return const Left(Failure.network());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await tokenRepository.deleteToken();
      return const Right(null);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    // For demo purposes, we can check if token exists
    final token = await tokenRepository.getToken();
    if (token != null) {
      return const Right(
        UserEntity(id: '1', email: 'user@dhira.io', name: 'Dhira User'),
      );
    }
    return const Right(null);
  }
}
