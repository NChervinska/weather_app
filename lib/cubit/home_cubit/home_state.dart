part of 'home_cubit.dart';

enum HomeStatus {
  init,
  loading,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String errorMessage;
  final WeatherWrapper? currentWeather;
  final List<WeatherWrapper> weathers;

  const HomeState({
    this.errorMessage = '',
    this.status = HomeStatus.loading,
    this.weathers = const [],
    this.currentWeather,
  });

  @override
  List<Object?> get props => [status, errorMessage, currentWeather, weathers];

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    WeatherWrapper? currentWeather,
    List<WeatherWrapper>? weathers,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      currentWeather: currentWeather ?? this.currentWeather,
      weathers: weathers ?? this.weathers,
    );
  }
}
