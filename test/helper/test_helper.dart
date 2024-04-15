import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;
import 'package:news/feautre/data/datasource/weather_remote.dart';
import 'package:news/feautre/domain/repositories/weather_repository.dart';
import 'package:news/feautre/domain/usecase/weather_usecase.dart';


@GenerateMocks(
  [
   WeatherRepository,
   WeatherRemoteDataSource,
   GetCurrentWeatherUseCase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient),],
)

void main() {}