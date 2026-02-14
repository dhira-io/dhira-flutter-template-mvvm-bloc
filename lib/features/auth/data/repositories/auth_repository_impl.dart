import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/storage/token_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageRepository secureStorageRepository;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorageRepository,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authModel = await remoteDataSource.login(
          username: username,
          password: password,
        );

        // Save tokens
        if (authModel.token != null) {
          await secureStorageRepository.saveAccessToken(authModel.token!);
        }
        if (authModel.refreshToken != null) {
          await secureStorageRepository.saveRefreshToken(
            authModel.refreshToken!,
          );
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

        // Save tokens
        if (authModel.token != null) {
          await secureStorageRepository.saveAccessToken(authModel.token!);
        }
        if (authModel.refreshToken != null) {
          await secureStorageRepository.saveRefreshToken(
            authModel.refreshToken!,
          );
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
      await secureStorageRepository.deleteAuthData();
      return const Right(null);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    final token = await secureStorageRepository.getAccessToken();
    if (token != null) {
      return const Right(
        UserEntity(
          id: '1',
          email: 'user@dhira.io',
          name: 'Dhira User',
          token: 'dummy',
          refreshToken: 'dummy',
        ),
      );
    }
    return const Right(null);
  }
}
