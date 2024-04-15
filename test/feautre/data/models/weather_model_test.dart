import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news/feautre/data/models/weather_model.dart';
import 'package:news/feautre/domain/entities/weather.dart';

import '../../../helper/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01n',
    temperature: 292.87,
    pressure: 1012,
    humidity: 70,
    maxTemp: 294.25,
  );
  test('should be subclass of weather entity', () async {
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test(
    'should retrun a valid model from json',
    () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helper/dummy_data/dummy_weather_response.json'),
      );
      final result = WeatherModel.fromJson(jsonMap);

      expect(result, equals(testWeatherModel));
    },
  );

  test('should return a json map containg proper data', () async {
    final result = testWeatherModel.toJson();

    final expectedJsonMap = {
      'weather': [
        {
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        }
      ],
      'main': {
        'temp': 292.87,
        'pressure': 1012,
        'humidity': 70,
        'maxTemp': 294.25,
      },
      'name': 'New York'
    };
    expect(result, equals(expectedJsonMap));
  });
}
