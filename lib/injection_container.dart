import 'package:get_it/get_it.dart';
import 'package:news/feautre/data/datasource/weather_remote.dart';
import 'package:news/feautre/data/repositories/weather_repository_impl.dart';
import 'package:news/feautre/domain/repositories/weather_repository.dart';
import 'package:news/feautre/domain/usecase/weather_usecase.dart';
import 'package:news/feautre/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
