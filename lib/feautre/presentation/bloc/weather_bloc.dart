import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feautre/domain/usecase/weather_usecase.dart';
import 'package:news/feautre/presentation/bloc/weather_event.dart';
import 'package:news/feautre/presentation/bloc/weather_state.dart';

import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  WeatherBloc(this._getCurrentWeatherUseCase) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        emit(WeatherLoading());
        final result =
            await _getCurrentWeatherUseCase.getWeather(event.cityName);
        result.fold(
          (failure) {
            emit(WeatherLoadFailue(failure.message));
          },
          (data) {
            emit(WeatherLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
