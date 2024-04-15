import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news/core/error/exception.dart';
import 'package:news/core/error/failure.dart';
import 'package:news/feautre/data/datasource/weather_remote.dart';
import 'package:news/feautre/domain/entities/weather.dart';
import 'package:news/feautre/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
