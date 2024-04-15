import 'package:news/core/error/failure.dart';
import 'package:news/feautre/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
