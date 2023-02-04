import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../model/weather_wrapper.dart';
import '../../service/api_service.dart';
import '../../service/preferences_service.dart';
import '../core/base_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  final ApiService apiService;
  final PreferencesService preferencesService;

  HomeCubit(
    this.apiService,
    this.preferencesService,
  ) : super(const HomeState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: HomeStatus.error,
    ));
  }

  Future<void> getWeathers() async {
    await performSafeAction(() async {
      emit(state.copyWith(status: HomeStatus.loading));

      final city = preferencesService.getCity();

      emit(state.copyWith(
        currentWeather: await apiService.getCurrentWeather(city),
        weathers: await apiService.getHourlyWeather(city),
        status: HomeStatus.init,
      ));
    });
  }
}
