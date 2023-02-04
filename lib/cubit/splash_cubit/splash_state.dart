part of 'splash_cubit.dart';

enum SplashStatus {
  home,
  city,
  init,
}

class SplashState extends Equatable {
  final SplashStatus status;

  const SplashState({
    this.status = SplashStatus.init,
  });

  @override
  List<Object?> get props => [status];
}
