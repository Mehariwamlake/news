import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/feautre/domain/entities/weather.dart';
import 'package:news/feautre/domain/usecase/weather_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
    maxTemp: 67,
  );

  const testCityName = 'New York';

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));

    // act
    final result = await getCurrentWeatherUseCase.getWeather(testCityName);

    // assert
    expect(result, const Right(testWeatherDetail));
  });
}
