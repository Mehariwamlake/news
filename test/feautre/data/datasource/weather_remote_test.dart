import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/feautre/data/datasource/weather_remote.dart';
import 'package:news/feautre/data/models/weather_model.dart';

import '../../../helper/json_reader.dart';
import '../../../helper/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = 'new';

  group('get current weather', () {
    test('shuld return weather model when the response code is 200', () async {
      when(mockHttpClient
              .get(Uri.parse(Urls.currentWeatherByName(testCityName))))
          .thenAnswer(
        (_) async => http.Response(
            readJson('helper/dummy_data/dummy_weather_response.json'), 200),
      );

      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);
      expect(result, isA<WeatherModel>());
    });
  });
}
