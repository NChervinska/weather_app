import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../cubit/city_cubit/city_cubit.dart';
import '../../di/di.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_strings.dart';
import '../../utils/dialogs_utils.dart';

enum CityFields { city }

class CityPage extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) => locator.get<CityCubit>(),
      child: CityPage._(),
    );
  }

  CityPage._();

  final _formKey = GlobalKey<FormBuilderState>();
  String get city {
    return _formKey.currentState?.value[CityFields.city.name] ?? '';
  }

  CityCubit getCubit(BuildContext context) => context.read();

  void _onStateChanged(BuildContext context, CityState state) {
    switch (state.status) {
      case CityStatus.error:
        Dialogs.of(context).showErrorToast(state.errorMessage);
        break;

      case CityStatus.success:
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.city),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                _buildField(context),
                const Spacer(),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(BuildContext context) {
    return FormBuilderTextField(
      name: CityFields.city.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(20)],
      decoration: const InputDecoration(labelText: AppStrings.city),
      validator: FormBuilderValidators.minLength(
        3,
        errorText: AppStrings.fieldMustBeAtLeast,
      ),
      onChanged: (_) {
        final valid = _formKey.currentState?.saveAndValidate();
        context.read<CityCubit>().setButtonEnabled(valid ?? false);
      },
    );
  }

  Widget _buildButton() {
    return BlocConsumer<CityCubit, CityState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.buttonEnabled
                ? () => getCubit(context).setCity(city)
                : null,
            child: const Text(AppStrings.next),
          ),
        );
      },
    );
  }
}
