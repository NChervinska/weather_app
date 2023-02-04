import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../service/preferences_service.dart';
import '../core/base_cubit.dart';

part 'city_state.dart';

@injectable
class CityCubit extends BaseCubit<CityState> {
  final PreferencesService preferencesService;

  CityCubit(
    this.preferencesService,
  ) : super(const CityState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: CityStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> setCity(String query) async {
    await performSafeAction(() async {
      preferencesService.setCity(query);

      emit(const CityState(status: CityStatus.success));
    });
  }

  void setButtonEnabled(bool buttonEnabled) {
    emit(state.copyWith(buttonEnabled: buttonEnabled));
  }
}
