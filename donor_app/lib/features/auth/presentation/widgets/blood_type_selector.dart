import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/auth/domain/enums/blood_type.dart';
import 'package:donor_app/features/auth/presentation/widgets/blood_type_option.dart';
import 'package:donor_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodTypeSelector extends StatefulWidget {
  const BloodTypeSelector({super.key, this.onBloodTypeSelected});

  final ValueChanged<String>? onBloodTypeSelected;

  @override
  State<BloodTypeSelector> createState() => _BloodTypeSelectorState();
}

class _BloodTypeSelectorState extends State<BloodTypeSelector> {
  BloodType? selectedType;
  final List<BloodType> bloodTypes = [
    BloodType.O_Positive,
    BloodType.O_Negative,
    BloodType.A_Positive,
    BloodType.A_Negative,
    BloodType.B_Positive,
    BloodType.B_Negative,
    BloodType.AB_Positive,
    BloodType.AB_Negative,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.select_blood_type,
              style: context.textStyles.font12SecondaryBold.copyWith(
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            Text(
              AppLocalizations.of(context)!.required,
              style: context.textStyles.font10PrimaryBold.copyWith(
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
          ),
          itemCount: bloodTypes.length,
          itemBuilder: (context, index) {
            final type = bloodTypes[index];
            return BloodTypeOption(
              isSelected: selectedType == type,
              title: type.label,
              onTap: () {
                setState(() {
                  selectedType = type;
                });
                widget.onBloodTypeSelected?.call(type.name);
              },
            );
          },
        ),
      ],
    );
  }
}
