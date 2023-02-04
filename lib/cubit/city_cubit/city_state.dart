part of 'city_cubit.dart';

enum CityStatus {
  error,
  init,
  success,
}

class CityState extends Equatable {
  final CityStatus status;
  final String errorMessage;
  final bool buttonEnabled;

  const CityState({
    this.errorMessage = '',
    this.status = CityStatus.init,
    this.buttonEnabled = false,
  });

  @override
  List<Object?> get props => [status, errorMessage, buttonEnabled];

  CityState copyWith({
    CityStatus? status,
    String? errorMessage,
    bool? buttonEnabled,
  }) {
    return CityState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      buttonEnabled: buttonEnabled ?? this.buttonEnabled,
    );
  }
}
