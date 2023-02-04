import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../service/preferences_service.dart';
import '../core/base_cubit.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  final PreferencesService preferencesService;

  SplashCubit(
    this.preferencesService,
  ) : super(const SplashState());

  @override
  void handleError(String errorMessage) {
    emit(const SplashState(status: SplashStatus.city));
  }

  Future<void> init() async {
    await performSafeAction(() async {
      final city = preferencesService.getCity();

      emit(SplashState(
        status: city == null ? SplashStatus.city : SplashStatus.home,
      ));
    });
  }
}
