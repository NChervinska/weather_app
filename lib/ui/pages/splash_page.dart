import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/splash_cubit/splash_cubit.dart';
import '../../di/di.dart';
import '../../resources/app_routes.dart';

class SplashPage extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) => locator.get<SplashCubit>(),
      child: const SplashPage._(),
    );
  }

  const SplashPage._();

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Timer _exitTimer;
  late final StreamSubscription _cubitStreamSubscription;

  SplashCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();

    _cubitStreamSubscription = cubit.stream.listen(
      _onStateChanged,
      cancelOnError: true,
    );
    _exitTimer = Timer(
      const Duration(seconds: 1),
      cubit.init,
    );
  }

  @override
  void dispose() {
    _exitTimer.cancel();
    _cubitStreamSubscription.cancel();
    super.dispose();
  }

  void _onStateChanged(SplashState state) {
    if (state.status == SplashStatus.home) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      return;
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.city);
  }

  HomeCubit getCubit(BuildContext context) => context.read();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
