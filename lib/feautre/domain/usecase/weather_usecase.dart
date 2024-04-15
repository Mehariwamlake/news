import 'package:dartz/dartz.dart';
import 'package:news/core/error/failure.dart';
import 'package:news/feautre/domain/entities/weather.dart';
import 'package:news/feautre/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
