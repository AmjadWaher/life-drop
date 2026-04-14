import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/resources/image_paths.dart';
import 'package:donor_app/core/widgets/app_images.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({super.key, required this.email, required this.onTap});
  final String email;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.grey.withAlpha(50),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5),
          bottom: Radius.circular(5),
        ),
      ),
      leading: const AppImages(path: ImagePaths.logo, type: ImageType.svg),
      title: Text(email, style: context.textStyles.font12TextPrimaryMedium),
      subtitle: const Text('*********'),
    );
  }
}
