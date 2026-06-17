import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/logic/biometric/biometric_cubit.dart';
import 'package:donor_app/core/logic/biometric/biometric_state.dart';
import 'package:donor_app/features/profile/presentation/widgets/account_settings/settings_toggle_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecurityBentoSection extends StatelessWidget {
  const SecurityBentoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.colors.neutral,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<BiometricCubit, BiometricState>(
        builder: (context, state) {
          return SettingsToggleTile(
            icon: Icons.fingerprint,
            title: context.localizations.enable_fingerprint,
            isSelected: state.isEnabled,
            onChanged: (value) => context.read<BiometricCubit>().toggle(value),
          );
        },
      ),
    );
  }
}
